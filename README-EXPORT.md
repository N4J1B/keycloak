# Keycloak Export Service

Service sederhana untuk export data realm dari Keycloak ke direktori `data/`.

## 🚀 Quick Start

```bash
# Export master realm
./export.sh master

# Export semua realms  
./export.sh all

# Export realm tertentu
./export.sh my-company-realm

# Export tanpa users
./export.sh my-realm skip_users
```

## 📋 Komponen

### Docker Service
- **Service**: `keycloak-exporter` 
- **Volume**: `./data` → `/opt/keycloak/data/export`
- **Profile**: `export` (run on-demand)

### Script Export
- **File**: `export.sh`
- **Fungsi**: Export realm dengan opsi sederhana

## 🔧 Penggunaan

### Opsi Export
```bash
./export.sh [realm-name|all] [export-type]
```

**Realm:**
- `master` - Export master realm
- `all` - Export semua realms  
- `realm-name` - Export realm tertentu

**Export Types:**
- `realm_file` - Include users (default)
- `skip_users` - Tanpa users
- `users_only` - Hanya users
- `different_files` - Users terpisah

### Contoh Penggunaan
```bash
# Help
./export.sh

# Export basic
./export.sh master
./export.sh all

# Export advanced  
./export.sh my-realm skip_users
./export.sh company-realm different_files
```

## 📁 Output

Export disimpan di `data/`:
```
data/
├── export.log
├── master-realm.json
├── my-company-realm.json
└── users-*.json (jika terpisah)
```

## 🛠️ Manual Export

Jika perlu kontrol penuh:
```bash
docker compose run --rm keycloak-exporter sh -c "
/opt/keycloak/bin/kc.sh export \
--dir /opt/keycloak/data/export \
--realm master \
--users realm_file
"
```

## 🔍 Troubleshooting

```bash
# Check status
docker-compose ps

# Check logs  
tail data/export.log
docker-compose logs keycloak

# Restart jika perlu
docker-compose restart keycloak
```

Selesai! 🎉