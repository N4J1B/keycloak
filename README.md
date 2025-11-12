
# Keycloak Docker Setup

Setup Keycloak dengan PostgreSQL database menggunakan Docker Compose.

## Pre Requisites
1. Docker & Docker Compose
2. PostgreSQL Database Server
3. Domain dengan SSL Certificate (.pem format)

## Cara Konfigurasi

### 1. Clone Repository
```bash
git clone <repository-url>
cd keycloak
```

### 2. Konfigurasi Environment Variables
Copy file `.env.example` menjadi `.env`:
```bash
cp .env.example .env
```

Edit file `.env` sesuai kebutuhan:
```
KEYCLOAK_ADMIN=admin
KEYCLOAK_ADMIN_PASSWORD=your_secure_password

POSTGRES_HOST=your_postgres_host
POSTGRES_PORT=5432
POSTGRES_DB=keycloak
POSTGRES_USER=postgres
POSTGRES_PASSWORD=your_db_password

SERVER_IP=your_server_ip
KEYCLOAK_HOSTNAME=https://your_domain:8443
```

### 3. Copy SSL Certificate
Copy file SSL certificate (.pem) dan private key (.pem) ke folder `/certs`:
```bash
cp your-domain.pem certs/
cp your-domain-key.pem certs/
```

**Note:** Update nama file certificate di `docker-compose.yml` jika berbeda.

### 4. Jalankan Aplikasi
```bash
./app.sh
```

## Akses Keycloak
- URL: `https://your_domain:8443`
- Admin Console: `https://your_domain:8443/admin`
- Username: sesuai `KEYCLOAK_ADMIN` di `.env`
- Password: sesuai `KEYCLOAK_ADMIN_PASSWORD` di `.env`

## Port yang Digunakan
- `8443` - Keycloak HTTPS
- `9000` - Keycloak Metrics

## Custom Theme
Project ini menggunakan custom theme Tailcloakify yang sudah include di folder `/themes`.
