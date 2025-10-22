import { useState, useEffect } from 'react'
import './App.css'

function App() {
    const [message, setMessage] = useState ('Ładowanie...')

    useEffect(() =>{

    fetch('http://localhost:8080/api/hello')
    .then(response => response.text())
    .then(data => setMessage(data))
    .catch(error => setMessage('Błąd: ' + error.message))
    },[])

return (
    <>
        <h1>Java Interview Prep</h1>
        <div className="card">
          <h2>Wiadomość z backendu:</h2>
          <p style={{ fontSize: '24px', color: '#61dafb'}}>{message}</p>
         </div>
        </>
         )
     }

 export default App
