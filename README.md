# TimeBank Platform

A full-stack application for time-based service exchange.

## Project Structure

```
timebank/
├── frontend/         # React frontend application
├── backend/         # Spring Boot backend application
├── docker-compose.yml
└── README.md
```

## Prerequisites

- Node.js 20+
- Java 17
- Docker
- PostgreSQL 15
- Redis 7

## Development

1. Start the backend:
```bash
cd backend
./mvnw spring-boot:run
```

2. Start the frontend:
```bash
cd frontend
npm install
npm run dev
```

## Production Deployment

1. Create `.env` file from `.env.example`
2. Build and run with Docker Compose:
```bash
docker-compose up -d
```

## Testing

- Frontend: `cd frontend && npm test`
- Backend: `cd backend && ./mvnw test`