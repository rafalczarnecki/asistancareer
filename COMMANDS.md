📝 Commands Cheatsheet - Java Interview Prep
Szybki dostęp do wszystkich ważnych komend.

🚀 Uruchamianie
Metoda 1: Skrypty
bash# Windows
start.bat

# Linux/Mac
chmod +x start.sh
./start.sh
Metoda 2: Maven
bash# Windows
mvnw.cmd spring-boot:run

# Linux/Mac
./mvnw spring-boot:run

# Bez frontendu (szybciej)
./mvnw spring-boot:run -Pdev
Metoda 3: Docker
bash# Uruchom
docker-compose up

# Uruchom w tle
docker-compose up -d

# Zatrzymaj
docker-compose down

# Rebuild i uruchom
docker-compose up --build

🔨 Buildowanie
Maven Build
bash# Pełny build
./mvnw clean package

# Bez testów (szybciej)
./mvnw clean package -DskipTests

# Tylko kompilacja
./mvnw compile

# Tylko testy
./mvnw test
Frontend Build
bashcd frontend

# Instalacja zależności
npm install

# Development server
npm run dev

# Production build
npm run build

# Lint
npm run lint
Docker Build
bash# Build obrazu
docker build -t interview-prep:latest .

# Build z docker-compose
docker-compose build

# Build bez cache
docker-compose build --no-cache

🧹 Czyszczenie
Maven Clean
bash# Wyczyść target/
./mvnw clean

# Wyczyść wszystko (włącznie z node_modules)
./mvnw clean
rm -rf frontend/node_modules
rm -rf frontend/dist
rm -rf logs
Docker Clean
bash# Usuń kontenery
docker-compose down

# Usuń kontenery + volumes
docker-compose down -v

# Usuń wszystkie nieużywane obrazy
docker system prune -a

# Usuń wszystko (OSTROŻNIE!)
docker system prune -a --volumes
Logs Clean
bash# Usuń logi
rm -rf logs/
rm -f *.log

# Windows
del /s /q logs\*

🔍 Sprawdzanie Statusu
Porty
bash# Linux/Mac - sprawdź port 8080
lsof -i :8080

# Windows - sprawdź port 8080
netstat -ano | findstr :8080

# Zabij proces na porcie (Linux/Mac)
kill -9 $(lsof -t -i:8080)

# Zabij proces na porcie (Windows)
# Znajdź PID: netstat -ano | findstr :8080
taskkill /PID <PID> /F
Docker Status
bash# Lista kontenerów
docker ps
docker-compose ps

# Logi
docker logs <container-id>
docker-compose logs
docker-compose logs -f  # follow

# Logi konkretnego serwisu
docker-compose logs app

# Resource usage
docker stats
Application Status
bash# Sprawdź czy działa
curl http://localhost:8080/api/hello

# Health check (jeśli Actuator jest włączony)
curl http://localhost:8080/actuator/health

# Metrics
curl http://localhost:8080/actuator/metrics

🧪 Testowanie
Backend Tests
bash# Wszystkie testy
./mvnw test

# Konkretna klasa
./mvnw test -Dtest=JavaInterviewPrepApplicationTests

# Z coverage
./mvnw test jacoco:report
Frontend Tests
bashcd frontend

# Run tests (jeśli skonfigurowane)
npm test

# Test coverage
npm run test:coverage
API Testing
bash# cURL
curl http://localhost:8080/api/hello
curl http://localhost:8080/api/questions

# httpie (jeśli zainstalowane)
http :8080/api/questions

# wget
wget -qO- http://localhost:8080/api/hello

📦 Zarządzanie Zależnościami
Maven Dependencies
bash# Lista wszystkich zależności
./mvnw dependency:tree

# Pobierz zależności
./mvnw dependency:resolve

# Sprawdź aktualizacje
./mvnw versions:display-dependency-updates

# Aktualizuj wersje
./mvnw versions:use-latest-versions
NPM Dependencies
bashcd frontend

# Lista zainstalowanych pakietów
npm list

# Sprawdź aktualizacje
npm outdated

# Aktualizuj pakiety
npm update

# Zainstaluj konkretny pakiet
npm install <package-name>

# Usuń pakiet
npm uninstall <package-name>

📄 Logi
Wyświetlanie Logów
bash# Backend logs (Metoda 1 - skrypty)
tail -f logs/backend.log

# Frontend logs (Metoda 1 - skrypty)
tail -f logs/frontend.log

# Application logs (Metoda 2/3)
tail -f logs/application.log

# Docker logs
docker-compose logs -f
docker-compose logs -f app
Filtrowanie Logów
bash# Linux/Mac
grep ERROR logs/application.log
tail -f logs/application.log | grep ERROR

# Windows PowerShell
Get-Content logs\application.log | Select-String "ERROR"

🔧 Development
Hot Reload
bash# Frontend (automatyczne)
cd frontend
npm run dev

# Backend (wymaga Spring DevTools)
./mvnw spring-boot:run
# Zmiany w kodzie -> auto restart
Debug Mode
bash# Maven debug (port 5005)
./mvnw spring-boot:run -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005"

# Podłącz debugger w IDE do portu 5005

🌐 Git Commands
Podstawowe
bash# Status
git status

# Add wszystkie zmiany
git add .

# Commit
git commit -m "Your message"

# Push
git push origin main

# Pull
git pull origin main
Branching
bash# Nowy branch
git checkout -b feature/new-feature

# Przełącz branch
git checkout main

# Lista branchy
git branch -a

# Usuń branch
git branch -d feature/old-feature
Problemy z Git
bash# Cofnij ostatni commit (zachowaj zmiany)
git reset --soft HEAD~1

# Cofnij wszystkie zmiany (OSTROŻNIE!)
git reset --hard HEAD

# Pokaż różnice
git diff

# Historia commitów
git log --oneline

🐳 Docker Advanced
Container Management
bash# Wejdź do kontenera
docker exec -it <container-id> sh

# Skopiuj pliki z kontenera
docker cp <container-id>:/app/logs ./local-logs

# Restart kontenera
docker restart <container-id>

# Stop wszystkich kontenerów
docker stop $(docker ps -aq)

# Usuń wszystkie kontenery
docker rm $(docker ps -aq)
Image Management
bash# Lista obrazów
docker images

# Usuń obraz
docker rmi <image-id>

# Tag obrazu
docker tag interview-prep:latest myrepo/interview-prep:v1.0

# Push do registry
docker push myrepo/interview-prep:v1.0
Network & Volumes
bash# Lista networks
docker network ls

# Lista volumes
docker volume ls

# Usuń nieużywane volumes
docker volume prune

# Inspect network
docker network inspect <network-name>

📊 Performance Monitoring
JVM Monitoring
bash# JVM info
java -XX:+PrintFlagsFinal -version | grep MaxHeapSize

# Thread dump
jstack <PID>

# Heap dump
jmap -dump:live,format=b,file=heap.bin <PID>
System Resources
bash# Linux
top
htop
free -h
df -h

# Docker resources
docker stats

# Disk usage
du -sh *

🔑 Environment Variables
Set Variables
bash# Linux/Mac
export SPRING_PROFILES_ACTIVE=prod
export JAVA_OPTS="-Xms512m -Xmx1024m"

# Windows CMD
set SPRING_PROFILES_ACTIVE=prod

# Windows PowerShell
$env:SPRING_PROFILES_ACTIVE="prod"
View Variables
bash# Linux/Mac
echo $SPRING_PROFILES_ACTIVE
printenv

# Windows CMD
echo %SPRING_PROFILES_ACTIVE%
set

# Windows PowerShell
$env:SPRING_PROFILES_ACTIVE
Get-ChildItem Env:

🆘 Quick Fixes
Port już używany
bash# Linux/Mac
kill -9 $(lsof -t -i:8080)

# Windows
netstat -ano | findstr :8080
taskkill /PID <PID> /F
Brak miejsca na dysku
bash# Docker cleanup
docker system prune -a --volumes

# Maven cleanup
./mvnw clean

# NPM cleanup
rm -rf frontend/node_modules
npm cache clean --force
Zepsute zależności
bash# Maven
./mvnw dependency:purge-local-repository

# NPM
rm -rf frontend/node_modules
rm frontend/package-lock.json
cd frontend && npm install

📱 Useful URLs
Development (Metoda 1):
- Frontend:  http://localhost:5173
- Backend:   http://localhost:8080
- API:       http://localhost:8080/api/questions

Production (Metoda 2/3):
- App:       http://localhost:8080
- API:       http://localhost:8080/api/questions
- Health:    http://localhost:8080/actuator/health

🎯 Makefile Commands
Jeśli masz make zainstalowane:
bashmake help          # Pokaż wszystkie komendy
make dev           # Uruchom development
make run           # Uruchom z Maven
make build         # Zbuduj projekt
make clean         # Wyczyść
make docker-up     # Uruchom Docker
make docker-down   # Zatrzymaj Docker
make test          # Uruchom testy

💡 Tips

Alias w bash/zsh (Linux/Mac):

bash   # Dodaj do ~/.bashrc lub ~/.zshrc
alias interview-start='./start.sh'
alias interview-stop='docker-compose down'
alias interview-logs='docker-compose logs -f'

Skróty Windows:
Stwórz skrót do start.bat na pulpicie
VS Code Tasks:
Dodaj do .vscode/tasks.json do szybkiego uruchamiania


Keep this file handy! 📌