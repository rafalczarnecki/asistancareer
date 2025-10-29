🚀 Deployment Guide - Java Interview Prep
Przewodnik po wdrażaniu aplikacji na serwer produkcyjny.

📦 Opcje Deploymentu
1. Deployment z JAR (Traditional)
2. Docker na VPS (Recommended)
3. Cloud Platforms (Heroku, Railway, Render)
4. Kubernetes (Advanced)

1️⃣ Deployment z JAR
Krok 1: Zbuduj aplikację
bash# Windows
mvnw.cmd clean package

# Linux/Mac
./mvnw clean package
To stworzy plik: target/java-interview-prep-0.0.1-SNAPSHOT.jar
Krok 2: Prześlij na serwer
bash# SCP (Linux/Mac)
scp target/java-interview-prep-0.0.1-SNAPSHOT.jar user@your-server.com:/opt/app/

# SFTP (Windows - użyj WinSCP lub FileZilla)
Krok 3: Uruchom na serwerze
bash# SSH do serwera
ssh user@your-server.com

# Uruchom aplikację
java -jar /opt/app/java-interview-prep-0.0.1-SNAPSHOT.jar

# Lub w tle z nohup
nohup java -jar /opt/app/java-interview-prep-0.0.1-SNAPSHOT.jar > app.log 2>&1 &
Krok 4: Systemd Service (Autostart)
Stwórz plik: /etc/systemd/system/interview-prep.service
ini[Unit]
Description=Java Interview Prep Application
After=syslog.target network.target

[Service]
User=appuser
ExecStart=/usr/bin/java -jar /opt/app/java-interview-prep-0.0.1-SNAPSHOT.jar
SuccessExitStatus=143
StandardOutput=journal
StandardError=journal
SyslogIdentifier=interview-prep

[Install]
WantedBy=multi-user.target
Uruchom:
bashsudo systemctl daemon-reload
sudo systemctl enable interview-prep
sudo systemctl start interview-prep
sudo systemctl status interview-prep

2️⃣ Docker na VPS (REKOMENDOWANE)
Wymagania na serwerze:

Docker
Docker Compose
1GB RAM minimum (2GB recommended)

Krok 1: Zainstaluj Docker na serwerze
bash# Ubuntu/Debian
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# Zainstaluj Docker Compose
sudo apt-get install docker-compose-plugin
Krok 2: Sklonuj repozytorium
bashgit clone https://github.com/rafalczarnecki/asistancareer.git
cd asistancareer
Krok 3: Uruchom z Docker Compose
bashdocker-compose up -d
Krok 4: Sprawdź status
bashdocker-compose ps
docker-compose logs -f
Krok 5: Nginx Reverse Proxy (opcjonalne)
Stwórz plik: /etc/nginx/sites-available/interview-prep
nginxserver {
listen 80;
server_name your-domain.com;

    location / {
        proxy_pass http://localhost:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
Aktywuj:
bashsudo ln -s /etc/nginx/sites-available/interview-prep /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
Krok 6: SSL z Let's Encrypt
bashsudo apt-get install certbot python3-certbot-nginx
sudo certbot --nginx -d your-domain.com
Aktualizacja aplikacji:
bashcd asistancareer
git pull origin main
docker-compose down
docker-compose up -d --build

3️⃣ Cloud Platforms
🟣 Heroku
Krok 1: Przygotuj projekt
Stwórz plik Procfile w głównym katalogu:
web: java -jar target/java-interview-prep-0.0.1-SNAPSHOT.jar
Stwórz plik system.properties:
java.runtime.version=21
Krok 2: Deploy
bash# Zaloguj się
heroku login

# Stwórz aplikację
heroku create your-app-name

# Deploy
git push heroku main

# Otwórz aplikację
heroku open

🟦 Railway
Krok 1: Połącz GitHub

Wejdź na https://railway.app/
Kliknij "Start a New Project"
Wybierz "Deploy from GitHub repo"
Wybierz swoje repozytorium

Krok 2: Konfiguracja
Railway automatycznie wykryje:

Dockerfile (jeśli istnieje)
pom.xml (Spring Boot)

Zmienne środowiskowe (opcjonalne):
SPRING_PROFILES_ACTIVE=prod
Krok 3: Deploy
Railway automatycznie zbuduje i wdroży przy każdym push do main!

🟩 Render
Krok 1: Połącz GitHub

Wejdź na https://render.com/
Kliknij "New +"
Wybierz "Web Service"
Połącz GitHub repository

Krok 2: Konfiguracja
Name: java-interview-prep
Environment: Docker
Build Command: (auto)
Start Command: (auto)
Zmienne środowiskowe:
JAVA_OPTS=-Xms256m -Xmx512m
Krok 3: Deploy
Render automatycznie zbuduje i wdroży!

☁️ AWS (Elastic Beanstalk)
Krok 1: Zainstaluj EB CLI
bashpip install awsebcli
Krok 2: Inicjalizuj
basheb init -p docker java-interview-prep
Krok 3: Stwórz środowisko
basheb create production
Krok 4: Deploy
basheb deploy
Otwórz aplikację
basheb open

4️⃣ Kubernetes (Advanced)
Deployment YAML
Stwórz plik k8s-deployment.yaml:
yamlapiVersion: apps/v1
kind: Deployment
metadata:
name: interview-prep
spec:
replicas: 3
selector:
matchLabels:
app: interview-prep
template:
metadata:
labels:
app: interview-prep
spec:
containers:
- name: interview-prep
image: your-registry/interview-prep:latest
ports:
- containerPort: 8080
env:
- name: SPRING_PROFILES_ACTIVE
value: "prod"
resources:
requests:
memory: "512Mi"
cpu: "500m"
limits:
memory: "1Gi"
cpu: "1000m"
livenessProbe:
httpGet:
path: /api/hello
port: 8080
initialDelaySeconds: 30
periodSeconds: 10
readinessProbe:
httpGet:
path: /api/hello
port: 8080
initialDelaySeconds: 20
periodSeconds: 5
---
apiVersion: v1
kind: Service
metadata:
name: interview-prep-service
spec:
selector:
app: interview-prep
ports:
- port: 80
  targetPort: 8080
  type: LoadBalancer
  Deploy:
  bashkubectl apply -f k8s-deployment.yaml
  kubectl get pods
  kubectl get services

🔧 Optymalizacja Produkcyjna
1. Profil produkcyjny
   Stwórz src/main/resources/application-prod.properties:
   properties# Server
   server.port=8080

# Logging (mniej verbose)
logging.level.root=WARN
logging.level.com.interview.java_interview_prep=INFO

# Compression
server.compression.enabled=true

# Cache
spring.web.resources.cache.cachecontrol.max-age=365d

# Actuator (monitoring)
management.endpoints.web.exposure.include=health,metrics,info
management.endpoint.health.show-details=when-authorized

# Graceful shutdown
server.shutdown=graceful
spring.lifecycle.timeout-per-shutdown-phase=20s
2. JVM Tuning
   bashjava -Xms512m -Xmx1024m \
   -XX:+UseG1GC \
   -XX:MaxGCPauseMillis=200 \
   -jar app.jar
3. Docker Optimization
   dockerfile# W Dockerfile dodaj:
   ENV JAVA_OPTS="-Xms512m -Xmx1024m -XX:+UseG1GC"
   ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]

📊 Monitoring
1. Spring Boot Actuator
   Dodaj do pom.xml:
   xml<dependency>
   <groupId>org.springframework.boot</groupId>
   <artifactId>spring-boot-starter-actuator</artifactId>
   </dependency>
   Endpoints:

/actuator/health - Status aplikacji
/actuator/metrics - Metryki
/actuator/info - Informacje o aplikacji

2. Logi
   bash# Sprawdź logi Docker
   docker-compose logs -f

# Sprawdź logi systemd
sudo journalctl -u interview-prep -f
3. Uptime Monitoring
   Użyj serwisów takich jak:

UptimeRobot (https://uptimerobot.com/)
Pingdom (https://www.pingdom.com/)
StatusCake (https://www.statuscake.com/)


🔐 Bezpieczeństwo
1. HTTPS
   Zawsze używaj HTTPS w produkcji:

Let's Encrypt (darmowe)
Cloudflare (proxy + SSL)

2. Firewall
   bash# UFW (Ubuntu)
   sudo ufw allow 22    # SSH
   sudo ufw allow 80    # HTTP
   sudo ufw allow 443   # HTTPS
   sudo ufw enable
3. Zmienne środowiskowe
   Nigdy nie commituj secrets do Git!
   bash# Użyj .env file (dodaj do .gitignore)
   DATABASE_PASSWORD=secret123
   API_KEY=your-key
   W docker-compose.yml:
   yamlservices:
   app:
   env_file:
    - .env
4. Rate Limiting
   W application.properties:
   properties# Bucket4j lub Spring Security

🔄 CI/CD Pipeline
GitHub Actions
Stwórz .github/workflows/deploy.yml:
yamlname: Deploy to Production

on:
push:
branches: [ main ]

jobs:
build-and-deploy:
runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3
    
    - name: Set up JDK 21
      uses: actions/setup-java@v3
      with:
        java-version: '21'
        distribution: 'temurin'
    
    - name: Build with Maven
      run: ./mvnw clean package -DskipTests
    
    - name: Build Docker image
      run: docker build -t interview-prep:latest .
    
    - name: Deploy to server
      uses: appleboy/ssh-action@master
      with:
        host: ${{ secrets.SERVER_HOST }}
        username: ${{ secrets.SERVER_USER }}
        key: ${{ secrets.SSH_PRIVATE_KEY }}
        script: |
          cd /opt/app
          git pull origin main
          docker-compose down
          docker-compose up -d --build

📋 Checklist przed Deploymentem

Testy przechodzą: ./mvnw test
Build działa: ./mvnw clean package
Docker build działa: docker-compose build
Zmienne środowiskowe skonfigurowane
HTTPS/SSL skonfigurowane
Monitoring skonfigurowany
Backup strategy określona
Domain name skonfigurowana
Firewall rules ustawione
Dokumentacja zaktualizowana


🆘 Troubleshooting Production
Aplikacja nie startuje
bash# Sprawdź logi
docker-compose logs

# Sprawdź porty
netstat -tulpn | grep 8080

# Sprawdź memory
free -h
docker stats
Out of Memory
bash# Zwiększ limity w docker-compose.yml
services:
app:
deploy:
resources:
limits:
memory: 2G
Wolna wydajność

Sprawdź metryki: /actuator/metrics
Zwiększ JVM heap: -Xmx2048m
Dodaj Redis cache
Użyj CDN dla statycznych plików


📞 Support
Jeśli masz problemy z deploymentem:

Sprawdź logi aplikacji
Zobacz README.md - Troubleshooting
Otwórz Issue na GitHub


Good luck with your deployment! 🚀