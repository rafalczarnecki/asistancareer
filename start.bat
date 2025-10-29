@echo off
chcp 65001 >nul
cls

echo ╔════════════════════════════════════════════════════════════╗
echo ║                                                            ║
echo ║         Java Interview Prep - Uruchamianie                ║
echo ║                                                            ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

REM ============================================
REM Krok 1: Sprawdzanie wymagań
REM ============================================
echo [1/4] Sprawdzanie wymagań systemowych...
echo.

REM Sprawdź Javę
echo    Sprawdzanie Java...
java -version >nul 2>&1
if errorlevel 1 (
    echo    ❌ BŁĄD: Java nie jest zainstalowana!
    echo.
    echo    Pobierz Java 21 ze strony:
    echo    https://adoptium.net/
    echo.
    pause
    exit /b 1
)
echo    ✅ Java jest zainstalowana

REM Sprawdź Node.js
echo    Sprawdzanie Node.js...
node -v >nul 2>&1
if errorlevel 1 (
    echo    ❌ BŁĄD: Node.js nie jest zainstalowany!
    echo.
    echo    Pobierz Node.js ze strony:
    echo    https://nodejs.org/
    echo.
    pause
    exit /b 1
)
echo    ✅ Node.js jest zainstalowany
echo.

REM ============================================
REM Krok 2: Instalacja zależności frontend
REM ============================================
echo [2/4] Instalowanie zależności frontend...
echo.

if not exist "frontend" (
    echo ❌ BŁĄD: Folder 'frontend' nie istnieje!
    pause
    exit /b 1
)

cd frontend

REM Sprawdź czy node_modules istnieje
if not exist "node_modules" (
    echo    Instalowanie pakietów npm (może potrwać kilka minut)...
    call npm install
    if errorlevel 1 (
        echo    ❌ BŁĄD: Instalacja npm nie powiodła się!
        cd ..
        pause
        exit /b 1
    )
    echo    ✅ Zależności zainstalowane
) else (
    echo    ✅ Zależności już zainstalowane (node_modules istnieje)
)

cd ..
echo.

REM ============================================
REM Krok 3: Informacje o uruchomieniu
REM ============================================
echo [3/4] Przygotowanie do uruchomienia...
echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║  Za chwilę uruchomią się DWA okna terminala:              ║
echo ║                                                            ║
echo ║  🔵 Okno 1: Backend (Spring Boot)                         ║
echo ║     URL: http://localhost:8080                            ║
echo ║                                                            ║
echo ║  🟢 Okno 2: Frontend (React + Vite)                       ║
echo ║     URL: http://localhost:5173                            ║
echo ║                                                            ║
echo ║  ⚠️  NIE ZAMYKAJ tych okien podczas pracy!                ║
echo ║                                                            ║
echo ║  Aby zatrzymać aplikację:                                 ║
echo ║  - Naciśnij Ctrl+C w każdym oknie                         ║
echo ║  - Lub po prostu zamknij okna                             ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
echo Naciśnij dowolny klawisz aby kontynuować...
pause >nul
echo.

REM ============================================
REM Krok 4: Uruchomienie aplikacji
REM ============================================
echo [4/4] Uruchamianie aplikacji...
echo.

REM Uruchom backend w nowym oknie
echo    🔵 Uruchamianie backend...
start "Java Interview Prep - BACKEND (Port 8080)" cmd /k "color 1F && echo ╔════════════════════════════════════════╗ && echo ║    BACKEND - Spring Boot               ║ && echo ║    Port: 8080                          ║ && echo ╚════════════════════════════════════════╝ && echo. && mvnw.cmd spring-boot:run"

REM Czekaj 5 sekund żeby backend się uruchomił
echo    ⏳ Czekam 5 sekund na uruchomienie backendu...
timeout /t 5 /nobreak >nul

REM Uruchom frontend w nowym oknie
echo    🟢 Uruchamianie frontend...
start "Java Interview Prep - FRONTEND (Port 5173)" cmd /k "color 2F && cd frontend && echo ╔════════════════════════════════════════╗ && echo ║    FRONTEND - React + Vite             ║ && echo ║    Port: 5173                          ║ && echo ╚════════════════════════════════════════╝ && echo. && npm run dev"

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║                                                            ║
echo ║  ✅ Aplikacja uruchomiona pomyślnie!                      ║
echo ║                                                            ║
echo ║  📱 Otwórz w przeglądarce:                                ║
echo ║     http://localhost:5173                                 ║
echo ║                                                            ║
echo ║  📚 API Backend dostępne na:                              ║
echo ║     http://localhost:8080                                 ║
echo ║                                                            ║
echo ║  🔍 Endpointy API:                                        ║
echo ║     http://localhost:8080/api/hello                       ║
echo ║     http://localhost:8080/api/questions                   ║
echo ║                                                            ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
echo Możesz zamknąć to okno. Aplikacja działa w dwóch innych oknach.
echo.
pause