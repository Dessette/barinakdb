import React, { useEffect, useState } from 'react';
import axios from 'axios';
import ShelterForm from '../components/ShelterForm';
import RefreshButton from '../components/RefreshButton';

const ShelterPage = () => {
  const [barinaklar, setBarinaklar] = useState([]);
  const [searchTerm, setSearchTerm] = useState('');

  useEffect(() => {
    axios.get('http://localhost:8000/api/barinak/')
      .then(response => {
        setBarinaklar(response.data);
      })
      .catch(error => {
        console.error('There was an error!', error);
      });
  }, []);

  const handleSearch = (event) => {
    setSearchTerm(event.target.value);
  };

  const filteredBarinaklar = barinaklar.filter(barinak =>
    barinak.isim.toLowerCase().includes(searchTerm.toLowerCase())
  );

  const addShelter = (newShelter) => {
    axios.post('http://localhost:8000/api/barinak/add/', newShelter)
      .then(response => {
        setBarinaklar([...barinaklar, response.data]);
      })
      .catch(error => {
        console.error('There was an error creating the shelter!', error);
      });
  };

  const deleteShelter = (barinak_id) => {
    axios.delete(`http://localhost:8000/api/barinak/delete/${barinak_id}/`)
      .then(() => {
        setBarinaklar(barinaklar.filter(barinak => barinak.barinak_id !== barinak_id));
      })
      .catch(error => {
        console.error('There was an error deleting the shelter!', error);
      });
  };

  return (
    <div>
      <h1>Manage Shelters</h1>
      <input
        type="text"
        value={searchTerm}
        onChange={handleSearch}
        placeholder="Search shelters..."
        style={{
          padding: '10px',
          width: '300px',
          borderRadius: '15px',
          border: '2px solid #ddd',
          marginBottom: '20px',
          fontSize: '16px',
        }}
      />
      <ShelterForm onAddShelter={addShelter} />
      <div className="shelter-list">
        <h1>List of Shelters</h1>
        <RefreshButton />
        <table style={{ width: '100%', borderCollapse: 'collapse' }}>
          <thead>
            <tr>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>ID</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>İsim</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>Adres</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>Telefon</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>Mail</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>Actions</th>
            </tr>
          </thead>
          <tbody>
            {filteredBarinaklar.map((barinak) => (
              <tr key={barinak.barinak_id}>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{barinak.barinak_id}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{barinak.isim}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{barinak.adres}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{barinak.telefon}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{barinak.mail}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>
                  <button onClick={() => deleteShelter(barinak.barinak_id)} style={{ padding: '5px 10px', borderRadius: '5px', background: 'red', color: 'white', border: 'none' }}>
                    Delete
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default ShelterPage;
