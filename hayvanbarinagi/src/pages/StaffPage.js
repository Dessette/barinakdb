import React, { useEffect, useState } from 'react';
import axios from 'axios';
import StaffForm from '../components/StaffForm';
import RefreshButton from '../components/RefreshButton';

const StaffPage = () => {
  const [personeller, setPersoneller] = useState([]);
  const [searchTerm, setSearchTerm] = useState('');

  useEffect(() => {
    axios.get('http://localhost:8000/api/personel/')
      .then(response => {
        console.log(response.data);
        setPersoneller(response.data);
      })
      .catch(error => {
        console.error('There was an error!', error);
      });
  }, []);

  const addStaff = (newStaff) => {
    setPersoneller([...personeller, newStaff]);
  };

  const deleteStaff = (personelId) => {
    axios.delete(`http://localhost:8000/api/personel/delete/${personelId}/`)
      .then(response => {
        setPersoneller(personeller.filter(personel => personel.personel_id !== personelId));
      })
      .catch(error => {
        console.error('Error deleting staff:', error);
      });
  };

  const handleSearch = (event) => {
    setSearchTerm(event.target.value);
  };

  const filteredPersoneller = personeller.filter(personel =>
    personel.isim.toLowerCase().includes(searchTerm.toLowerCase()) ||
    personel.soyisim.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div>
      <h1>Manage Staff</h1>
      <input
        type="text"
        value={searchTerm}
        onChange={handleSearch}
        placeholder="Search staff..."
        style={{
          padding: '10px',
          width: '300px',
          borderRadius: '15px',
          border: '2px solid #ddd',
          marginBottom: '20px',
          fontSize: '16px',
        }}
      />
      <StaffForm onAddStaff={addStaff} />
      <div className="staff-list">
        <h1>List of Staff</h1>
        <RefreshButton />
        <table style={{ width: '100%', borderCollapse: 'collapse' }}>
          <thead>
            <tr>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>ID</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>İsim</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>Soyisim</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>Telefon</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>Mail</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>Barınak</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>Actions</th>
            </tr>
          </thead>
          <tbody>
            {filteredPersoneller.map((personel) => (
              <tr key={personel.personel_id}>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{personel.personel_id}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{personel.isim}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{personel.soyisim}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{personel.telefon}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{personel.mail}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{personel.barinak}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>
                  <button onClick={() => deleteStaff(personel.personel_id)} style={{ padding: '5px 10px', borderRadius: '5px', background: 'red', color: 'white', border: 'none' }}>
                    Delete
                  </button>
                </td>
              </tr>
            ))}
            {filteredPersoneller.length === 0 && (
              <tr>
                <td colSpan="7" style={{ padding: '10px', textAlign: 'center' }}>No staff available</td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default StaffPage;
