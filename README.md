# 🎓 Java Interview Prep

Aplikacja webowa do nauki pytań rekrutacyjnych z języka Java. Projekt składa się z backendu (Spring Boot) oraz frontendu (React + Vite).

![Java](https://img.shields.io/badge/Java-21-orange)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.5.6-green)
![React](https://img.shields.io/badge/React-19.1.1-blue)
![Vite](https://img.shields.io/badge/Vite-7.1.7-purple)

---

## 📋 Spis treści

- [Wymagania](#-wymagania)
- [Metody uruchomienia](#-metody-uruchomienia)
    - [Metoda 1: Szybki start (skrypty)](#metoda-1-szybki-start-dla-developerów-)
    - [Metoda 2: Zintegrowany Maven](#metoda-2-zintegrowany-maven-dla-prezentacji-)
    - [Metoda 3: Docker](#metoda-3-docker-dla-produkcji-)
- [Struktura projektu](#-struktura-projektu)
- [API Endpoints](#-api-endpoints)
- [Konfiguracja](#-konfiguracja)
- [Troubleshooting](#-troubleshooting)

---

## 🔧 Wymagania

### Metoda 1 i 2 (Skrypty / Maven):
- **Java 21** lub nowsza ([Pobierz tutaj](https://adoptium.net/))
- **Node.js 18+** ([Pobierz tutaj](https://nodejs.org/)) - tylko dla Metody 1
- **npm** (instalowany wraz z Node.js) - tylko dla Metody 1

### Metoda 3 (Docker):
- **Docker Desktop** ([Pobierz tutaj](https://www.docker.com/products/docker-desktop/))

---

## 🚀 Metody uruchomienia

Wybierz metodę, która najbardziej Ci odpowiada:

---

### Metoda 1: Szybki start (dla developerów) ⚡

**Najlepsza dla**: Programistów pracujących nad projektem, szybkie zmiany z hot-reload

#### Windows:
```batch
start.bat
```
Po prostu kliknij dwukrotnie plik `start.bat` lub uruchom go z terminala.

#### Linux/Mac:
```bash
chmod +x start.sh
./start.sh
```

#### Co się stanie:
1. Skrypt sprawdzi wymagania (Java, Node.js)
2. Zainstaluje zależności npm (jeśli trzeba)
3. Otworzy **DWA** okna terminala:
    - 🔵 **Backend** na porcie `8080`
    - 🟢 **Frontend** na porcie `5173`

#### URLs:
- **Aplikacja**: http://localhost:5173
- **Backend API**: http://localhost:8080

#### Zatrzymanie:
- Naciśnij `Ctrl+C` w każdym oknie
- Lub po prostu zamknij okna terminala

#### ✅ Zalety:
- Hot-reload dla React (natychmiastowe zmiany)
- Szybkie dla developmentu
- Osobne logi dla backend i frontend

---

### Metoda 2: Zintegrowany Maven (dla prezentacji) 🎯

**Najlepsza dla**: Demo, prezentacje, deployment, jeden port dla wszystkiego

#### Uruchomienie:

**Windows:**
```batch
mvnw.cmd spring-boot:run
```

**Linux/Mac:**
```bash
./mvnw spring-boot:run
```

#### Co się stanie:
1. Maven automatycznie:
    - Zainstaluje Node.js (jeśli trzeba)
    - Zainstaluje npm dependencies
    - Zbuduje frontend (React)
    - Skompiluje backend (Java)
    - Skopiuje frontend do `target/classes/static/`
    - Uruchomi Spring Boot
2. Aplikacja dostępna na **JEDNYM** porcie

#### URL:
- **Wszystko**: http://localhost:8080

#### Zatrzymanie:
- Naciśnij `Ctrl+C` w terminalu

#### ✅ Zalety:
- Jedna komenda
- Jeden port (brak CORS issues)
- Gotowe do deployment
- Nie wymaga Node.js na systemie

#### ⚠️ Uwaga:
- Pierwsze uruchomienie może zająć **3-5 minut** (pobieranie Node.js, budowanie)
- Każda zmiana wymaga przebudowania

#### Szybsze uruchomienie (bez budowania frontendu):
```bash
# Windows
mvnw.cmd spring-boot:run -Pdev

# Linux/Mac
./mvnw spring-boot:run -Pdev
```

---

### Metoda 3: Docker (dla produkcji) 🐳

**Najlepsza dla**: Deployment, serwery, przenośność, CI/CD

#### Wymagania:
- Docker Desktop zainstalowany i uruchomiony

#### Uruchomienie:
```bash
docker-compose up
```

Lub z budowaniem od nowa:
```bash
docker-compose up --build
```

W tle (detached mode):
```bash
docker-compose up -d
```

#### Co się stanie:
1. Docker zbuduje obraz (multi-stage build):
    - Stage 1: Kompilacja backend (Java)
    - Stage 2: Budowanie frontend (React)
    - Stage 3: Połączenie i optymalizacja
2. Uruchomi kontener z aplikacją

#### URL:
- **Wszystko**: http://localhost:8080

#### Zatrzymanie:
```bash
docker-compose down
```

#### Logi:
```bash
docker-compose logs -f
```

#### Status:
```bash
docker-compose ps
```

#### ✅ Zalety:
- Działa identycznie wszędzie (Windows/Mac/Linux)
- Nie wymaga Java ani Node.js na systemie
- Izolowane środowisko
- Gotowe do deployment na serwer
- Łatwa skalowalność

#### 📦 Rozmiary:
- Pierwsza budowa: ~10 minut (pobieranie obrazów)
- Obraz finalny: ~250-300 MB
- RAM: ~512 MB - 1 GB

---

## 📁 Struktura projektu
```
java-interview-prep/
├── 📄 start.bat                 # Skrypt startowy Windows
├── 📄 start.sh                  # Skrypt startowy Linux/Mac
├── 📄 Dockerfile                # Konfiguracja Docker
├── 📄 docker-compose.yml        # Docker Compose
├── 📄 .dockerignore             # Ignorowane pliki w Docker
├── 📄 pom.xml                   # Maven configuration
├── 📄 mvnw / mvnw.cmd           # Maven Wrapper
│
├── 📂 src/                      # Backend (Spring Boot)
│   ├── 📂 main/
│   │   ├── 📂 java/
│   │   │   └── 📂 com/interview/java_interview_prep/
│   │   │       ├── JavaInterviewPrepApplication.java
│   │   │       ├── Question.java
│   │   │       └── TestController.java
│   │   └── 📂 resources/
│   │       ├── application.properties
│   │       └── 📂 static/        # Frontend po zbudowaniu (Metoda 2)
│   └── 📂 test/
│
├── 📂 frontend/                  # Frontend (React + Vite)
│   ├── 📂 src/
│   │   ├── App.jsx
│   │   ├── App.css
│   │   ├── main.jsx
│   │   └── index.css
│   ├── 📄 package.json
│   ├── 📄 vite.config.js
│   └── 📄 index.html
│
├── 📂 logs/                      # Logi aplikacji (tworzone automatycznie)
└── 📂 target/                    # Pliki zbudowane (Maven)
```

---

## 🔌 API Endpoints

### Backend API (Spring Boot)

| Metoda | Endpoint | Opis | Przykładowa odpowiedź |
|--------|----------|------|----------------------|
| `GET` | `/api/hello` | Test endpoint | `"Hello from Spring Boot!"` |
| `GET` | `/api/question` | Pojedyncze pytanie | `{"id": 1, "question": "...", "answer": "..."}` |
| `GET` | `/api/questions` | Lista wszystkich pytań | `[{...}, {...}, {...}]` |

### Przykłady użycia:

#### cURL:
```bash
# Test endpoint
curl http://localhost:8080/api/hello

# Pobierz wszystkie pytania
curl http://localhost:8080/api/questions
```

#### JavaScript (Fetch):
```javascript
// W przeglądarce lub Node.js
fetch('http://localhost:8080/api/questions')
  .then(response => response.json())
  .then(data => console.log(data));
```

---

## ⚙️ Konfiguracja

### Porty

#### Metoda 1 (Skrypty):
- Backend: `8080` (można zmienić w `application.properties`)
- Frontend: `5173` (można zmienić w `vite.config.js`)

#### Metoda 2 i 3 (Maven/Docker):
- Aplikacja: `8080` (można zmienić w `docker-compose.yml`)

### Zmiana portu backendu:

**`src/main/resources/application.properties`:**
```properties
server.port=8080
```

### Zmiana portu frontendu (tylko Metoda 1):

**`frontend/vite.config.js`:**
```javascript
export default defineConfig({
  plugins: [react()],
  server: {
    port: 5173  // Zmień tutaj
  }
})
```

---

## 🐛 Troubleshooting

### Problem: "Java nie jest zainstalowana"

**Rozwiązanie:**
```bash
# Sprawdź wersję Java
java -version

# Powinno pokazać: openjdk version "21.x.x" lub nowsze
```

Jeśli nie masz Java, pobierz ze strony: https://adoptium.net/

---

### Problem: "Port 8080 jest już używany"

**Rozwiązanie:**

**Windows:**
```batch
# Zobacz co używa portu 8080
netstat -ano | findstr :8080

# Zabij proces (zamień PID na numer z poprzedniej komendy)
taskkill /PID <PID> /F
```

**Linux/Mac:**
```bash
# Zobacz co używa portu 8080
lsof -i :8080

# Zabij proces
kill -9 <PID>
```

---

### Problem: Frontend pokazuje "Cannot connect to backend"

**Sprawdź:**
1. Czy backend działa: http://localhost:8080/api/hello
2. Czy CORS jest poprawnie skonfigurowany w `TestController.java`
3. Czy port w `App.jsx` jest poprawny

---

## 📚 Dodatkowe informacje

### Dodawanie nowych pytań

Edytuj plik: `src/main/java/com/interview/java_interview_prep/TestController.java`
```java
@GetMapping("/questions")
public List<Question> getQuestions() {
    return List.of(
        new Question(1L, "Twoje pytanie?", "Twoja odpowiedź"),
        new Question(2L, "Kolejne pytanie?", "Kolejna odpowiedź"),
        // Dodaj więcej tutaj
    );
}
```

---

## 🤝 Contributing

1. Fork projektu
2. Stwórz branch: `git checkout -b feature/amazing-feature`
3. Commit zmian: `git commit -m 'Add amazing feature'`
4. Push: `git push origin feature/amazing-feature`
5. Otwórz Pull Request

---

## 📝 Licencja

Ten projekt jest open source i dostępny na licencji MIT.

---

## 👨‍💻 Autor

Rafał Czarnecki - [GitHub](https://github.com/rafalczarnecki)

---

## 🆘 Potrzebujesz pomocy?

Jeśli masz problemy, otwórz [Issue na GitHub](https://github.com/rafalczarnecki/asistancareer/issues)

---

**Happy Coding! 🚀**