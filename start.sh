#!/bin/bash

echo "========================================"
echo "  Java Interview Prep - Uruchamianie"
echo "========================================"

# Sprawdzanie wymagań
echo ""
echo "[1/3] Sprawdzanie wymagań..."

if ! command -v java &> /dev/null; then
    echo "BŁĄD: Java nie jest zainstalowana!"
    exit 1
fi

if ! command -v node &> /dev/null; then
    echo "BŁĄD: Node.js nie jest zainstalowany!"
    exit 1
fi

# Instalacja zależności
echo ""
echo "[2/3] Instalowanie zależności frontend..."
cd frontend
npm install || { echo "BŁĄD: Instalacja npm nie powiodła się!"; exit 1; }

# Uruchamianie
echo ""
echo "[3/3] Uruchamianie aplikacji..."
echo ""
echo "Backend będzie dostępny na: http://localhost:8080"
echo "Frontend będzie dostępny na: http://localhost:5173"
echo ""

# Uruchom backend w tle
cd ..
./mvnw spring-boot:run &
BACKEND_PID=$!

# Poczekaj chwilę
sleep 5

# Uruchom frontend w tle
cd frontend
npm run dev &
FRONTEND_PID=$!

echo ""
echo "Aplikacja uruchomiona!"
echo "Aby zatrzymać: kill $BACKEND_PID $FRONTEND_PID"

# Czekaj na Ctrl+C
trap "kill $BACKEND_PID $FRONTEND_PID; exit" INT
wait