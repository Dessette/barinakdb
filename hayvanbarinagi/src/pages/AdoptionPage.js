import React, { useEffect, useState } from 'react';
import axios from 'axios';
import AdoptionForm from '../components/AdoptionForm';
import RefreshButton from '../components/RefreshButton';

const AdoptionPage = () => {
  const [sahiplenenler, setSahiplenenler] = useState([]);
  const [searchTerm, setSearchTerm] = useState('');

  useEffect(() => {
    axios.get('http://localhost:8000/api/sahiplenen/')
      .then(response => {
        console.log(response.data);
        setSahiplenenler(response.data);
      })
      .catch(error => {
        console.error('There was an error!', error);
      });
  }, []);

  const addAdoption = (newAdoption) => {
    axios.post('http://localhost:8000/api/sahiplenen/add/', newAdoption)
      .then(response => {
        setSahiplenenler([...sahiplenenler, response.data]);
      })
      .catch(error => {
        console.error('There was an error creating the adoption!', error);
      });
  };

  const deleteAdoption = (sahiplenmeId) => {
    axios.delete(`http://localhost:8000/api/sahiplenen/delete/${sahiplenmeId}/`)
      .then(response => {
        setSahiplenenler(sahiplenenler.filter(sahiplenen => sahiplenen.sahiplenme_id !== sahiplenmeId));
      })
      .catch(error => {
        console.error('Error deleting adoption:', error);
      });
  };

  const handleSearch = (event) => {
    setSearchTerm(event.target.value);
  };

  const filteredSahiplenenler = sahiplenenler.filter(sahiplenen =>
    sahiplenen.isim.toLowerCase().includes(searchTerm.toLowerCase()) ||
    sahiplenen.soyisim.toLowerCase().includes(searchTerm.toLowerCase())
  );


  return (
    <div >
      <h1>Manage Adoptions </h1>
      <input
        type="text"
        value={searchTerm}
        onChange={handleSearch}
        placeholder="Search adoptions..."
        style={{
          padding: '10px',
          width: '300px',
          borderRadius: '15px',
          border: '2px solid #ddd',
          marginBottom: '20px',
          fontSize: '16px',
        }}
      />
      <AdoptionForm onAddAdoption={addAdoption} />
      <div className="adoptions-list">
        <h1>List of Adoptions</h1>
        <RefreshButton />
        <table>
          <thead>
            <tr>
              <th>ID</th>
              <th>Adopter Name</th>
              <th>Adopter Surname</th>
              <th>Phone</th>
              <th>Email</th>
              <th>Animal Name</th>
              <th>Animal Type</th>
              <th>Animal Breed</th>
              <th>Animal Age</th>
              <th>Health Status</th>
              <th>Shelter</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            {sahiplenenler.map((sahiplenen) => (
              <tr key={sahiplenen.sahiplenme_id}>
                <td>{sahiplenen.sahiplenme_id}</td>
                <td>{sahiplenen.isim}</td>
                <td>{sahiplenen.soyisim}</td>
                <td>{sahiplenen.telefon}</td>
                <td>{sahiplenen.mail}</td>
                <td>{sahiplenen.hayvan.isim}</td>
                <td>{sahiplenen.hayvan.tur}</td>
                <td>{sahiplenen.hayvan.cins}</td>
                <td>{sahiplenen.hayvan.yas}</td>
                <td>{sahiplenen.hayvan.saglik_durumu}</td>
                <td>{sahiplenen.hayvan.barinak}</td>
                <td>
                  <button onClick={() => deleteAdoption(sahiplenen.sahiplenme_id)} style={{ padding: '5px 10px', borderRadius: '5px', background: 'red', color: 'white', border: 'none' }}>
                  Delete
                  </button>
                </td>
              </tr>
            ))}
            {sahiplenenler.length === 0 && (
              <tr>
                <td colSpan="12">No adoptions available</td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default AdoptionPage;
