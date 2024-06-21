import logo from './logo.svg';
import './App.css';
import { useEffect, useState } from 'react';
import { test } from './api';

function App() {

  const [testText, setTestText] = useState("");

  const fetchTestApi = async () => {
    const res = await test();
    const resData = await res.json();
    setTestText(resData.test)
  }

  useEffect(() => {
    fetchTestApi();
  }, [])
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Frontend de proyecto de lenguajes DB
        </p>
        <p>
          {testText}
        </p>
      </header>
    </div>
  );
}

export default App;
