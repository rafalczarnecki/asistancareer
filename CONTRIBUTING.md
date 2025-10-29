🤝 Contributing to Java Interview Prep
Dziękujemy za zainteresowanie współtworzeniem projektu! Każdy wkład jest mile widziany.

📋 Spis treści

Jak mogę pomóc?
Getting Started
Development Workflow
Coding Standards
Commit Guidelines
Pull Request Process
Dodawanie pytań


🎯 Jak mogę pomóc?
1. Dodawanie nowych pytań rekrutacyjnych

Pytania z rozmów kwalifikacyjnych
Pytania teoretyczne z Javy
Pytania praktyczne/code challenges

2. Ulepszanie istniejącego kodu

Refactoring
Optymalizacja wydajności
Poprawa struktury

3. Dodawanie nowych funkcji

System kategorii pytań
Wyszukiwarka
Losowanie pytań
System trudności pytań
Progress tracking

4. Poprawianie błędów

Bugfixy
Poprawki w UI/UX
Problemy z responsive design

5. Dokumentacja

Tłumaczenie dokumentacji
Tworzenie tutoriali
Aktualizacja README

6. Testowanie

Pisanie testów jednostkowych
Testy integracyjne
E2E testy


🚀 Getting Started
1. Fork repozytorium
   Kliknij "Fork" w prawym górnym rogu na GitHub.
2. Sklonuj swój fork
   bashgit clone https://github.com/YOUR-USERNAME/asistancareer.git
   cd asistancareer
3. Dodaj upstream remote
   bashgit remote add upstream https://github.com/rafalczarnecki/asistancareer.git
4. Uruchom projekt lokalnie
   bash# Wybierz metodę (patrz README.md)
   ./start.sh  # lub start.bat na Windows
5. Stwórz nowy branch
   bashgit checkout -b feature/your-feature-name

🔄 Development Workflow
1. Synchronizuj z upstream
   Przed rozpoczęciem pracy:
   bashgit checkout main
   git fetch upstream
   git merge upstream/main
   git push origin main
2. Twórz swój feature branch
   bashgit checkout -b feature/add-new-questions
3. Wprowadź zmiany
   Pracuj nad swoją funkcją...
4. Testuj lokalne zmiany
   bash# Backend tests
   ./mvnw test

# Sprawdź czy aplikacja działa
./start.sh
5. Commit zmian
   bashgit add .
   git commit -m "feat: add 10 new Java questions"
6. Push do swojego forka
   bashgit push origin feature/add-new-questions
7. Otwórz Pull Request
   Wejdź na GitHub i kliknij "New Pull Request".

📝 Coding Standards
Backend (Java/Spring Boot)
Konwencje nazewnictwa
java// Klasy: PascalCase
public class QuestionService { }

// Metody: camelCase
public List<Question> getAllQuestions() { }

// Stałe: UPPER_SNAKE_CASE
private static final int MAX_QUESTIONS = 100;

// Zmienne: camelCase
private String questionText;
Struktura kodu
java@RestController
@RequestMapping("/api")
public class QuestionController {

    // 1. Fields
    private final QuestionService questionService;
    
    // 2. Constructor
    public QuestionController(QuestionService questionService) {
        this.questionService = questionService;
    }
    
    // 3. Public methods
    @GetMapping("/questions")
    public List<Question> getQuestions() {
        return questionService.findAll();
    }
    
    // 4. Private methods
    private void validate(Question question) {
        // validation logic
    }
}
Best Practices

Używaj dependency injection
Dodawaj JavaDoc do publicznych metod
Unikaj magic numbers
Piszę testy dla nowego kodu
Używaj Lombok do redukcji boilerplate

java// ✅ GOOD
@Data
@AllArgsConstructor
public class Question {
private Long id;
private String question;
private String answer;
}

// ❌ BAD - za dużo boilerplate
public class Question {
private Long id;
private String question;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    // ... więcej getterów i setterów
}
Frontend (React)
Konwencje nazewnictwa
javascript// Komponenty: PascalCase
function QuestionCard() { }

// Funkcje/zmienne: camelCase
const fetchQuestions = () => { }
const questionList = [];

// Stałe: UPPER_SNAKE_CASE
const API_BASE_URL = 'http://localhost:8080';
Struktura komponentu
javascriptimport { useState, useEffect } from 'react'
import './QuestionCard.css'

// 1. Props type (jeśli TypeScript)
// interface QuestionCardProps { ... }

// 2. Component
function QuestionCard({ question }) {
// 3. State
const [showAnswer, setShowAnswer] = useState(false)

    // 4. Effects
    useEffect(() => {
        // side effects
    }, [])
    
    // 5. Event handlers
    const handleToggle = () => {
        setShowAnswer(!showAnswer)
    }
    
    // 6. Render helpers
    const renderAnswer = () => {
        if (!showAnswer) return null
        return <p>{question.answer}</p>
    }
    
    // 7. Return JSX
    return (
        <div className="question-card">
            <h3>{question.question}</h3>
            <button onClick={handleToggle}>Toggle</button>
            {renderAnswer()}
        </div>
    )
}

export default QuestionCard
Best Practices

Używaj functional components z hooks
Dziel na małe, reusable komponenty
Używaj prop validation (PropTypes lub TypeScript)
Unikaj inline styles (używaj CSS modules)
Optymalizuj re-renders (useMemo, useCallback)

javascript// ✅ GOOD - czytelne, małe
function QuestionList({ questions }) {
return (
<div className="question-list">
{questions.map(q => (
<QuestionCard key={q.id} question={q} />
))}
</div>
)
}

// ❌ BAD - za duże, wszystko w jednym
function App() {
// 500 linii kodu...
}

💬 Commit Guidelines
Używamy Conventional Commits.
Format
<type>(<scope>): <subject>

<body>

<footer>
Types

feat: Nowa funkcjonalność
fix: Naprawa błędu
docs: Zmiany w dokumentacji
style: Formatowanie, brakujące średniki (nie wpływa na kod)
refactor: Refactoring kodu
test: Dodanie lub modyfikacja testów
chore: Aktualizacja zależności, konfiguracji

Przykłady
bash# Nowa funkcjonalność
git commit -m "feat(questions): add category filter"

# Naprawa błędu
git commit -m "fix(api): correct CORS configuration"

# Dokumentacja
git commit -m "docs(readme): update installation instructions"

# Refactoring
git commit -m "refactor(controller): simplify question endpoint"

# Testy
git commit -m "test(service): add unit tests for QuestionService"

# Chore
git commit -m "chore(deps): update Spring Boot to 3.5.7"
Commit Message Tips
✅ GOOD:
feat(questions): add difficulty level to questions

- Add difficulty field to Question entity
- Update API to include difficulty
- Add UI toggle for difficulty filter
  ❌ BAD:
  updated stuff

🔀 Pull Request Process
1. Przed stworzeniem PR
   Checklist:

Kod jest przetestowany lokalnie
Wszystkie testy przechodzą (./mvnw test)
Kod jest sformatowany zgodnie ze standardami
Dokumentacja jest zaktualizowana (jeśli potrzeba)
Branch jest zsynchronizowany z main

bash# Zsynchronizuj z upstream
git fetch upstream
git rebase upstream/main
2. Tytuł PR
   Podobny format jak commit message:
   feat(questions): Add 20 new Spring Boot interview questions
   fix(ui): Fix responsive layout on mobile devices
   docs(contributing): Add coding standards section
3. Opis PR
   Template:
   markdown## Co zostało zmienione?

Krótki opis zmian...

## Typ zmiany

- [ ] Nowa funkcjonalność (feat)
- [ ] Naprawa błędu (fix)
- [ ] Dokumentacja (docs)
- [ ] Inne: ___________

## Jak przetestować?

1. Uruchom aplikację
2. Przejdź do...
3. Sprawdź czy...

## Screenshots (jeśli UI)

[Dodaj screenshoty]

## Checklist

- [ ] Kod został przetestowany lokalnie
- [ ] Testy przechodzą
- [ ] Dokumentacja zaktualizowana
- [ ] Brak konfliktów z main
4. Review Process

Czekaj na review od maintainerów
Odpowiadaj na komentarze
Wprowadzaj sugerowane zmiany
Push zmian do tego samego brancha (PR się zaktualizuje)

5. Merge
   Maintainer zmerguje PR gdy:

Wszystkie testy przechodzą
Code review approved
Brak konfliktów
CI/CD pipeline przechodzi (jeśli skonfigurowany)


❓ Dodawanie pytań
Format pytania
javanew Question(
id,                              // Long - unikalne ID
"Pytanie?",                      // String - treść pytania
"Odpowiedź..."                   // String - pełna odpowiedź
)
Gdzie dodać pytania?
Plik: src/main/java/com/interview/java_interview_prep/TestController.java
java@GetMapping("/questions")
public List<Question> getQuestions() {
return List.of(
new Question(1L, "Co to jest JVM?", "Java Virtual Machine..."),
new Question(2L, "Czym różni się JDK od JRE?", "JDK to..."),
// DODAJ NOWE TUTAJ
new Question(10L, "Twoje nowe pytanie?", "Twoja odpowiedź")
);
}
Dobre praktyki dla pytań
✅ GOOD:
javanew Question(
15L,
"Co to jest Dependency Injection w Spring?",
"Dependency Injection to wzorzec projektowy, który pozwala na " +
"automatyczne dostarczanie zależności do klasy. W Spring możemy " +
"użyć @Autowired, constructor injection lub setter injection."
)
❌ BAD:
javanew Question(
15L,
"DI?",  // Za krótkie pytanie
"To coś w Spring"  // Za krótka/niejasna odpowiedź
)
Kategorie pytań (sugestie)

Core Java: Podstawy języka, typy danych, OOP
Collections: List, Set, Map, Queue
Multithreading: Threads, Synchronization, Executors
Spring Framework: IoC, DI, AOP, Boot
Database: JPA, Hibernate, SQL
Testing: JUnit, Mockito
Design Patterns: Singleton, Factory, Strategy
Best Practices: SOLID, Clean Code


🐛 Zgłaszanie błędów
Przed zgłoszeniem

Sprawdź czy błąd nie został już zgłoszony
Spróbuj odtworzyć błąd
Sprawdź logi

Format zgłoszenia
markdown**Opis błędu**
Krótki, jasny opis co się stało.

**Kroki do odtworzenia**
1. Uruchom aplikację
2. Przejdź do...
3. Kliknij na...
4. Błąd pojawia się

**Oczekiwane zachowanie**
Co powinno się stać.

**Aktualne zachowanie**
Co się faktycznie dzieje.

**Screenshots**
Jeśli możliwe, dodaj screenshoty.

**Środowisko**
- OS: [Windows 11 / macOS 14 / Ubuntu 22.04]
- Java: [21]
- Node: [20.11.0]
- Browser: [Chrome 120]

**Dodatkowy kontekst**
Logi, error messages, stack traces.

💡 Sugestie nowych funkcji
Format propozycji
markdown**Problem który funkcja rozwiązuje**
Opisz problem lub potrzebę.

**Proponowane rozwiązanie**
Opisz jak wyobrażasz sobie rozwiązanie.

**Alternatywy**
Jakie inne rozwiązania rozważałeś?

**Dodatkowy kontekst**
Mockupy, screenshoty, linki do podobnych rozwiązań.

🧪 Testowanie
Backend Tests
bash# Uruchom wszystkie testy
./mvnw test

# Uruchom konkretną klasę testową
./mvnw test -Dtest=QuestionControllerTest

# Z coverage
./mvnw test jacoco:report
Pisanie testów
java@SpringBootTest
class QuestionServiceTest {

    @Autowired
    private QuestionService questionService;
    
    @Test
    void shouldReturnAllQuestions() {
        // Given
        int expectedSize = 10;
        
        // When
        List<Question> questions = questionService.findAll();
        
        // Then
        assertNotNull(questions);
        assertEquals(expectedSize, questions.size());
    }
}

📚 Dodatkowe zasoby

Spring Boot Documentation
React Documentation
Conventional Commits
Git Flow
Java Code Conventions


🙋 Pytania?
Jeśli masz pytania:

Sprawdź README.md
Sprawdź istniejące Issues
Otwórz nowe Issue z tagiem question


📜 Code of Conduct
Nasze wartości

Bądź uprzejmy: Traktuj wszystkich z szacunkiem
Bądź pomocny: Dziel się wiedzą
Bądź konstruktywny: Krytyka powinna być konstruktywna
Bądź cierpliwy: Pamiętaj, że wszyscy się uczymy

Niedopuszczalne zachowania

Obraźliwy język lub imagery
Trolling, komentarze obraźliwe
Harassment
Ujawnianie prywatnych informacji

Enforcement
Naruszenia będą skutkowały:

Ostrzeżeniem
Tymczasowym banem
Permanentnym banem


🎉 Podziękowania
Dziękujemy wszystkim kontrybutrom! Wasza pomoc jest nieoceniona.
Lista kontrybutorów
[To będzie automatycznie generowane przez GitHub]

Happy Contributing! 🚀