import './css/App.css';

import Header from "./components/Header";
import Footer from "./components/Footer";
import Navbar from './components/NavBar';
import Home from './components/Home';
import SearchPlayerByFilter from './components/SearchPlayerByFilter';
import { Container } from 'react-bootstrap';
import { Routes, Route } from 'react-router-dom';


function App() {
  return (
    <>
      <Header />
      <Navbar />

      <main className="py-3">
        <Container>
          <Routes>
            <Route path="/"  element={ <Home /> } />
            <Route path="/consultar-jugadores"  element={ <SearchPlayerByFilter/> } />
          </Routes>
        </Container>
      </main>

      <Footer />
    </>
  );
}

export default App;
