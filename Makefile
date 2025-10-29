.PHONY: help dev build clean docker-build docker-up docker-down docker-logs install test

# Default target
help:
	@echo "╔════════════════════════════════════════════════════╗"
	@echo "║                                                    ║"
	@echo "║  Java Interview Prep - Dostępne komendy           ║"
	@echo "║                                                    ║"
	@echo "╚════════════════════════════════════════════════════╝"
	@echo ""
	@echo "Development:"
	@echo "  make dev          - Uruchom w trybie dev (skrypty)"
	@echo "  make build        - Zbuduj projekt (Maven)"
	@echo "  make run          - Uruchom z Maven (jeden port)"
	@echo "  make clean        - Wyczyść pliki budowania"
	@echo ""
	@echo "Frontend:"
	@echo "  make install      - Zainstaluj npm dependencies"
	@echo "  make frontend     - Uruchom tylko frontend"
	@echo ""
	@echo "Docker:"
	@echo "  make docker-build - Zbuduj obraz Docker"
	@echo "  make docker-up    - Uruchom z Docker Compose"
	@echo "  make docker-down  - Zatrzymaj Docker Compose"
	@echo "  make docker-logs  - Zobacz logi Docker"
	@echo ""
	@echo "Testing:"
	@echo "  make test         - Uruchom testy"
	@echo ""

# Development - uruchom skryptem
dev:
ifeq ($(OS),Windows_NT)
	@start.bat
else
	@./start.sh
endif

# Build z Maven
build:
ifeq ($(OS),Windows_NT)
	@mvnw.cmd clean package
else
	@./mvnw clean package
endif

# Run z Maven (zintegrowany)
run:
ifeq ($(OS),Windows_NT)
	@mvnw.cmd spring-boot:run
else
	@./mvnw spring-boot:run
endif

# Clean
clean:
ifeq ($(OS),Windows_NT)
	@mvnw.cmd clean
else
	@./mvnw clean
endif
	@rm -rf frontend/node_modules
	@rm -rf frontend/dist
	@rm -rf logs

# Install frontend dependencies
install:
	@cd frontend && npm install

# Run only frontend
frontend:
	@cd frontend && npm run dev

# Docker build
docker-build:
	@docker-compose build

# Docker up
docker-up:
	@docker-compose up

# Docker up in background
docker-up-bg:
	@docker-compose up -d

# Docker down
docker-down:
	@docker-compose down

# Docker logs
docker-logs:
	@docker-compose logs -f

# Run tests
test:
ifeq ($(OS),Windows_NT)
	@mvnw.cmd test
else
	@./mvnw test
endif

# Backend only (dev profile - bez frontendu)
backend:
ifeq ($(OS),Windows_NT)
	@mvnw.cmd spring-boot:run -Pdev
else
	@./mvnw spring-boot:run -Pdev
endif