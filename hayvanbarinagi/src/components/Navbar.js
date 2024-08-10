import React from 'react';
import { Link } from 'react-router-dom';
import './Navbar.css';

function Navbar() {
  return (
    <nav>
      <ul>
        <li><Link to="/">Home</Link></li>
        <li><Link to="/shelters">Shelters</Link></li>
        <li><Link to="/animals">Animals</Link></li>
        <li><Link to="/adoptions">Adoptions</Link></li>
        <li><Link to="/visitors">Visitors</Link></li>
        <li><Link to="/staff">Staff</Link></li>
        <li><Link to="/sponsors">Sponsors</Link></li>
      </ul>
    </nav>
  );
}

export default Navbar;
