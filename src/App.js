import logo from './logo.svg';
import './App.css';
import { useEffect } from 'react';
import { test } from './api';

function App() {

  const fetchTestApi = async () => {
    const res = await test();
    console.log('print: res: ', res);
  }

  useEffect(() => {
    fetchTestApi();
  }, [])
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Frontend de proyecto de lenguajes
        </p>
      </header>
    </div>
  );
}

export default App;
