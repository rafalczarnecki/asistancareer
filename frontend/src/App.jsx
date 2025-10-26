import { useState, useEffect } from 'react'
import './App.css'

function QuestionCard ({ question}) {
    const [showAnswer, setShowAnswer] = useState(false)

    return (
        <div className="card">
            <h3>Pytanie #{question.id}</h3>
            <p style={{ fontSize: '18px', fontWeight: 'bold'}}>
                {question.question}
                </p>

                <button onClick={() => setShowAnswer(!showAnswer)}>
                    {showAnswer ? 'Ukryj odpowiedź' : 'Pokaż odpowiedź'}
                </button>

                {showAnswer && (
                    <>
                        <hr />
                        <p style={{fontSize: '14px', color: '#61dafb'}}>
                            {question.answer}
                        </p>
                    </>
                    )}
                </div>
        )
    }

function App () {
    const [questions, setQuestions] = useState([])
    const [loading, setLoading] = useState(true)
    const [error, setError] = useState(null)

    useEffect (() => {
        fetch('http://localhost:8080/api/questions')
        .then(response => response.json())
        .then(data => {
            setQuestions(data)
                setLoading(false)
            })
        .catch(err => {
            setError(err.message)
            setLoading(false)
            })
        }, [])

    if (loading) return <h1>Ładowanie...</h1>
    if (error) return <h1>Błąd: {error}</h1>

    return (
        <>

            {questions.map(question => (
                <QuestionCard key={question.id} question={question} />

                ))}
            </>
        )
    }

export default App