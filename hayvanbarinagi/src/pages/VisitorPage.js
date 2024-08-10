import React, { useEffect, useState } from 'react';
import axios from 'axios';
import VisitorForm from '../components/VisitorForm';
import RefreshButton from '../components/RefreshButton';

const VisitorPage = () => {
  const [ziyaretci, setZiyaretci] = useState([]);
  const [searchTerm, setSearchTerm] = useState('');

  useEffect(() => {
    axios.get('http://localhost:8000/api/ziyaretci/')
      .then(response => {
        console.log(response.data);
        setZiyaretci(response.data);
      })
      .catch(error => {
        console.error('There was an error!', error);
      });
  }, []);

  const addVisitor = (newVisitor) => {
    axios.post('http://localhost:8000/api/ziyaretci/add/', newVisitor)
      .then(response => {
        setZiyaretci([...ziyaretci, response.data]);
      })
      .catch(error => {
        console.error('There was an error creating the visitor!', error);
      });
  };

  const deleteVisitor = (ziyaretciId) => {
    axios.delete(`http://localhost:8000/api/ziyaretci/delete/${ziyaretciId}/`)
      .then(response => {
        setZiyaretci(ziyaretci.filter(ziyaret => ziyaret.ziyaretci_id !== ziyaretciId));
      })
      .catch(error => {
        console.error('Error deleting visitor:', error);
      });
  };

  const handleSearch = (event) => {
    setSearchTerm(event.target.value);
  };

  const filteredZiyaretci = ziyaretci.filter(ziyaret =>
    ziyaret.isim.toLowerCase().includes(searchTerm.toLowerCase()) ||
    ziyaret.soyisim.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div>
      <h1>Manage Visitors</h1>
      <input
        type="text"
        value={searchTerm}
        onChange={handleSearch}
        placeholder="Search visitors..."
        style={{
          padding: '10px',
          width: '300px',
          borderRadius: '15px',
          border: '2px solid #ddd',
          marginBottom: '20px',
          fontSize: '16px',
        }}
      />
      <VisitorForm onAddVisitor={addVisitor} />
      <div className="visitors-list">
        <h1>List of Visitors</h1>
        <RefreshButton />
        <table style={{ width: '100%', borderCollapse: 'collapse' }}>
          <thead>
            <tr>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>ID</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>İsim</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>Soyisim</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>Telefon</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>Mail</th>
              <th style={{ padding: '10px', borderBottom: '2px solid #ddd' }}>Actions</th>
            </tr>
          </thead>
          <tbody>
            {filteredZiyaretci.map((ziyaret) => (
              <tr key={ziyaret.ziyaretci_id}>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{ziyaret.ziyaretci_id}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{ziyaret.isim}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{ziyaret.soyisim}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{ziyaret.telefon}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>{ziyaret.mail}</td>
                <td style={{ padding: '10px', borderBottom: '1px solid #ddd' }}>
                  <button onClick={() => deleteVisitor(ziyaret.ziyaretci_id)} style={{ padding: '5px 10px', borderRadius: '5px', background: 'red', color: 'white', border: 'none' }}>
                    Delete
                  </button>
                </td>
              </tr>
            ))}
            {filteredZiyaretci.length === 0 && (
              <tr>
                <td colSpan="6" style={{ padding: '10px', textAlign: 'center' }}>No visitors available</td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default VisitorPage;
