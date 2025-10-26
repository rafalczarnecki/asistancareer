# Java Interview Prep 🎯

Interaktywna aplikacja edukacyjna do przygotowania się na rozmowę kwalifikacyjną na stanowisko Java Developer.

## 📋 O Projekcie

Java Interview Prep to fullstack aplikacja, która pomaga programistom przygotować się do rozmów technicznych. Użytkownik może przeglądać pytania z różnych obszarów Javy, odpowiadać na nie i śledzić swoje postępy.

**Status:** 🚧 W aktywnym rozwoju (MVP)

## 🛠️ Stack Technologiczny

### Backend
- **Java 21+** / Spring Boot 3.5.6
- **Maven** - zarządzanie zależnościami
- **Spring Web** - REST API
- **Lombok** - redukcja boilerplate code
- **DevTools** - hot reload podczas developmentu

### Frontend
- **React 19** + Vite 7
- **JavaScript (ES6+)**
- **ESLint** - linting
- **CSS3** - stylowanie

### Narzędzia
- IntelliJ IDEA
- Git & GitHub
- Node.js 22+

## 🚀 Uruchomienie Projektu

### Wymagania
- Java JDK 21 lub nowszy
- Node.js 22 lub nowszy
- Maven (wrapper zawarty w projekcie)

### Backend (Spring Boot)
```bash
# Przejdź do folderu projektu
cd java-interview-prep

# Uruchom backend (Windows)
mvnw.cmd spring-boot:run

# Uruchom backend (Linux/Mac)
./mvnw spring-boot:run
```

Backend będzie dostępny na: `http://localhost:8080`

### Frontend (React)
```bash
# Przejdź do folderu frontend
cd java-interview-prep/frontend

# Zainstaluj zależności (tylko pierwsz raz)
npm install

# Uruchom frontend
npm run dev
```

Frontend będzie dostępny na: `http://localhost:5173`

## 📁 Struktura Projektu
```
java-interview-prep/
├── src/
│   ├── main/
│   │   ├── java/com/interview/java_interview_prep/
│   │   │   ├── JavaInterviewPrepApplication.java  # Główna klasa aplikacji
│   │   │   ├── TestController.java                # REST endpoints
│   │   │   └── Question.java                      # Model pytania
│   │   └── resources/
│   │       └── application.properties              # Konfiguracja Spring Boot
│   └── test/                                       # Testy jednostkowe
├── frontend/
│   ├── src/
│   │   ├── App.jsx                                 # Główny komponent React
│   │   ├── main.jsx                                # Entry point
│   │   └── *.css                                   # Style
│   ├── package.json                                # Zależności npm
│   └── vite.config.js                              # Konfiguracja Vite
├── pom.xml                                         # Konfiguracja Maven
└── mvnw / mvnw.cmd                                 # Maven Wrapper
```

## 🔌 API Endpoints

### GET `/api/hello`
Testowy endpoint do sprawdzenia połączenia.

**Response:**
```
Hello from Spring Boot!
```

### GET `/api/question`
Zwraca pojedyncze pytanie do nauki.

**Response:**
```json
{
  "id": 1,
  "question": "Co to jest JVM?",
  "answer": "Java Virtual Machine - wirtualna maszyna która wykonuje kod Java"
}
```

## 🎯 Roadmap

### MVP (v0.1) - W trakcie
- [x] Konfiguracja projektu (backend + frontend)
- [x] Podstawowy REST API
- [x] Model Question
- [x] Integracja frontend-backend
- [ ] Wyświetlanie pytań w UI
- [ ] Lista pytań (hardcoded)

### v0.2 - Planowane
- [ ] Mechanizm odpowiadania na pytania
- [ ] Porównywanie odpowiedzi użytkownika
- [ ] Śledzenie postępów
- [ ] Kategoryzacja pytań

### v0.3 - Przyszłość
- [ ] Baza danych (H2/PostgreSQL)
- [ ] JPA/Hibernate
- [ ] Adaptywny poziom trudności
- [ ] Testy jednostkowe
- [ ] Deployment (Docker, Heroku, Vercel)

## 📚 Cel Edukacyjny

Projekt służy nauce:
- **Backend:** Spring Boot, REST API, Java OOP, warstwy aplikacji
- **Frontend:** React Hooks, fetch API, komunikacja z backendem
- **Fullstack:** Integracja, CORS, separacja concerns
- **DevOps:** Maven, npm, uruchamianie lokalnych serwerów

## 🤝 Rozwój

Projekt rozwijany metodą **spiralnego uczenia** - iteracyjne dodawanie funkcjonalności z pogłębianiem wiedzy.

## 📝 Licencja

Projekt edukacyjny - wykorzystanie na własne potrzeby.

## 👤 Autor

Rafał Czarnecki  
GitHub: [@rafalczarnecki](https://github.com/rafalczarnecki)

---

**Wersja:** 0.1.0-SNAPSHOT  
**Ostatnia aktualizacja:** Październik 2025s