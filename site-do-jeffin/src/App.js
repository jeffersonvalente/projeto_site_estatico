import logo from './logo.png';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Projeto Site Estático.
        </p>
        <a
          className="App-link"
          href="https://www.linkedin.com/in/jefferson-hoy-valente/"
          target="_blank"
          rel="noopener noreferrer"
        >
          Meu Linkedin
        </a>
        <a
          className="App-link"
          href="https://github.com/jeffersonvalente"
          target="_blank"
          rel="noopener noreferrer"
        >
          Meu Github
        </a>
      </header>
    </div>

  );

}

export default App;
