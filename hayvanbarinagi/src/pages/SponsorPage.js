import React, { useEffect, useState } from 'react';
import axios from 'axios';
import SponsorForm from '../components/SponsorForm';
import RefreshButton from '../components/RefreshButton';

const SponsorPage = () => {
  const [sponsorlar, setSponsorlar] = useState([]);
  const [searchTerm, setSearchTerm] = useState('');

  useEffect(() => {
    axios.get('http://localhost:8000/api/sponsor/')
      .then(response => {
        setSponsorlar(response.data);
      })
      .catch(error => {
        console.error('There was an error!', error);
      });
  }, []);

  const addSponsor = (newSponsor) => {
    setSponsorlar([...sponsorlar, newSponsor]);
  };

  const deleteSponsor = (sponsorId) => {
    axios.delete(`http://localhost:8000/api/sponsor/delete/${sponsorId}/`)
      .then(response => {
        setSponsorlar(sponsorlar.filter(sponsor => sponsor.sponsor_id !== sponsorId));
      })
      .catch(error => {
        console.error("Error deleting sponsor:", error);
      });
  };

  const handleSearch = (event) => {
    setSearchTerm(event.target.value);
  };

  const filteredSponsorlar = sponsorlar.filter(sponsor =>
    sponsor.isim.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div>
      <h1>Manage Sponsors</h1>
      <input
        type="text"
        value={searchTerm}
        onChange={handleSearch}
        placeholder="Search sponsors..."
        style={{
          padding: '10px',
          width: '300px',
          borderRadius: '15px',
          border: '2px solid #ddd',
          marginBottom: '20px',
          fontSize: '16px',
        }}
      />
      <SponsorForm onAddSponsor={addSponsor} />
      <div className="sponsor-list">
        <h1>List of Sponsors</h1>
        <RefreshButton />
        <table>
          <thead>
            <tr>
              <th>ID</th>
              <th>İsim</th>
              <th>Telefon</th>
              <th>Mail</th>
              <th>Açıklama</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            {sponsorlar.map((sponsor) => (
              <tr key={sponsor.sponsor_id}>
                <td>{sponsor.sponsor_id}</td>
                <td>{sponsor.isim}</td>
                <td>{sponsor.telefon}</td>
                <td>{sponsor.mail}</td>
                <td>{sponsor.barinak_isim}'na {sponsor.bagis_miktari} TL bağış yapılmıştır.</td>
                <td>
                  <button onClick={() => deleteSponsor(sponsor.sponsor_id)} style={{ padding: '5px 10px', borderRadius: '5px', background: 'red', color: 'white', border: 'none' }}>
                    Delete
                  </button>
                </td>
              </tr>
            ))}
            {sponsorlar.length === 0 && (
              <tr>
                <td colSpan="7">No sponsors available</td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default SponsorPage;
