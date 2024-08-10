import React, { useEffect, useState } from 'react';
import axios from 'axios';
import AnimalForm from '../components/AnimalForm';
import RefreshButton from '../components/RefreshButton';
import './list.css';

const AnimalPage = () => {
  const [hayvanlar, setHayvanlar] = useState([]);
  const [searchTerm, setSearchTerm] = useState('');

  useEffect(() => {
    axios.get('http://localhost:8000/api/hayvan/')
      .then(response => {
        console.log(response.data);
        setHayvanlar(response.data);
      })
      .catch(error => {
        console.error('There was an error!', error);
      });
  }, []);

  const addAnimal = (newAnimal) => {
    axios.post('http://localhost:8000/api/hayvan/add/', newAnimal)
      .then(response => {
        setHayvanlar([...hayvanlar, response.data]);
      })
      .catch(error => {
        console.error('There was an error creating the animal!', error);
      });
  };

  const deleteAnimal = (hayvanId) => {
    axios.delete(`http://localhost:8000/api/hayvan/delete/${hayvanId}/`)
      .then(response => {
        setHayvanlar(hayvanlar.filter(hayvan => hayvan.hayvan_id !== hayvanId));
      })
      .catch(error => {
        console.error('Error deleting animal:', error);
      });
  };

  const handleSearch = (event) => {
    setSearchTerm(event.target.value);
  };

  const filteredHayvanlar = hayvanlar.filter(hayvan =>
    hayvan.isim.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div>
      <h1>Manage Animals</h1>
      <input
        type="text"
        value={searchTerm}
        onChange={handleSearch}
        placeholder="Search animals..."
        style={{
          padding: '10px',
          width: '300px',
          borderRadius: '15px',
          border: '2px solid #ddd',
          marginBottom: '20px',
          fontSize: '16px',
        }}
      />
      <AnimalForm onAddAnimal={addAnimal} />
      <div className="animal-list">
        <h1>List of Animals</h1>
        <RefreshButton />
        <table style={{ width: '100%', borderCollapse: 'collapse' }}>
          <thead>
            <tr>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>ID</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>İsim</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>Tür</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>Cins</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>Cinsiyet</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>Yaş</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>Sağlık Durumu</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>Sahiplenme Durumu</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>Giriş Tarihi</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>Barınak</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>Actions</th>
            </tr>
          </thead>
          <tbody>
            {filteredHayvanlar.map((hayvan) => (
              <tr key={hayvan.hayvan_id}>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{hayvan.hayvan_id}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{hayvan.isim}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{hayvan.tur}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{hayvan.cins}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{hayvan.cinsiyet}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{hayvan.yas}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{hayvan.saglik_durumu}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{hayvan.sahiplenme_durum}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{hayvan.giris_tarihi}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{hayvan.barinak}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>
                  <button onClick={() => deleteAnimal(hayvan.hayvan_id)} style={{ padding: '5px 10px', borderRadius: '5px', background: 'red', color: 'white', border: 'none' }}>
                    Delete
                  </button>
                </td>
              </tr>
            ))}
            {filteredHayvanlar.length === 0 && (
              <tr>
                <td colSpan="11" style={{ padding: '10px', textAlign: 'center' }}>No animals available</td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default AnimalPage;
