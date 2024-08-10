import React, { useState } from 'react';
import axios from 'axios';  // axios'u import ediyoruz
import './Form.css';

function SponsorForm({ onAddSponsor }) {
  const [formData, setFormData] = useState({
    sponsorId: '',  // ID alanı eklendi
    sponsorName: '',
    sponsorPhone: '',
    sponsorEmail: '',
    barinakIsim: '',
    bagisMiktari: ''
  });

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value
    });
  };

  const handleRefresh = () => {
    // This will refresh the page
    window.location.reload();
  }

  const handleSubmit = (e) => {
    e.preventDefault();
    const dataToSend = {
      sponsor_id: formData.sponsorId,
      isim: formData.sponsorName,
      telefon: formData.sponsorPhone,
      mail: formData.sponsorEmail,
    };
  
    axios.post('http://localhost:8000/api/sponsor/add/', dataToSend)
      .then(response => {
        console.log("Sponsor başarıyla eklendi:", response.data);
        onAddSponsor(response.data);  // Yeni sponsoru ekliyoruz
      })
      .catch(error => {
        console.error("Sponsor eklenirken hata oluştu:", error);
      });
  
    setFormData({ sponsorId: '', sponsorName: '', sponsorPhone: '', sponsorEmail: '' });
  };
  

  return (
    <form onSubmit={handleSubmit} className="form-inline">
      <input type="text" name="sponsorId" placeholder="Sponsor ID" value={formData.sponsorId} onChange={handleChange} />
      <input type="text" name="sponsorName" placeholder="Sponsor Name" value={formData.sponsorName} onChange={handleChange} />
      <input type="text" name="sponsorPhone" placeholder="Sponsor Phone" value={formData.sponsorPhone} onChange={handleChange} />
      <input type="email" name="sponsorEmail" placeholder="Sponsor Email" value={formData.sponsorEmail} onChange={handleChange} />
      <input type="text" name="barinakIsim" placeholder="Barinak Ismi" value={formData.barinakIsim} onChange={handleChange} />
      <input type="number" name="bagisMiktari" placeholder="Bağış Miktarı" value={formData.bagisMiktari} onChange={handleChange} />
      <button type="submit">Submit</button>
    </form>
  );
}

export default SponsorForm;


