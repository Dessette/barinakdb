import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Navbar from './components/Navbar';
import HomePage from './pages/HomePage';
import AnimalPage from './pages/AnimalPage';
import AdoptionPage from './pages/AdoptionPage';
import VisitorPage from './pages/VisitorPage';
import StaffPage from './pages/StaffPage';
import ShelterPage from './pages/ShelterPage';
import SponsorPage from './pages/SponsorPage';
import './Header.css';

function App() {
  return (
    
    <Router>
      <div className="App">
        <h1>Shelter</h1>
      </div>
      <Navbar></Navbar>
      <Routes>
        <Route path="/" exact element={<HomePage />} />
        <Route path="/animals" element={<AnimalPage />} />
        <Route path="/adoptions" element={<AdoptionPage />} />
        <Route path="/visitors" element={<VisitorPage />} />
        <Route path="/staff" element={<StaffPage />} />
        <Route path="/shelters" element={<ShelterPage />} />
        <Route path="/sponsors" element={<SponsorPage />} />
      </Routes>
    </Router>
  );
}

export default App;
