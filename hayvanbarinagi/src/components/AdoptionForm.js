import React, { useState } from 'react';
import './Form.css';

function AdoptionForm({ onAddAdoption }) {
  const [formData, setFormData] = useState({
    sahiplenme_id: '',
    isim: '',
    soyisim: '',
    telefon: '',
    mail: '',
    hayvan: ''  // Foreign key olan hayvan_id burada yer alacak
  });

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value
    });
  };


  const handleSubmit = (e) => {
    e.preventDefault();
    console.log(formData);
    onAddAdoption(formData);
    setFormData({ sahiplenme_id: '', isim: '', soyisim: '', telefon: '', mail: '', hayvan: '' });
  };

  return (
    <form onSubmit={handleSubmit} className="form-inline">
      <input type="text" name="sahiplenme_id" placeholder="Adoption ID" onChange={handleChange} />
      <input type="text" name="isim" placeholder="Adopter First Name" onChange={handleChange} />
      <input type="text" name="soyisim" placeholder="Adopter Last Name" onChange={handleChange} />
      <input type="text" name="telefon" placeholder="Adopter Phone" onChange={handleChange} />
      <input type="email" name="mail" placeholder="Adopter Email" onChange={handleChange} />
      <input type="text" name="hayvan" placeholder="Animal ID" onChange={handleChange} />  
      <button type="submit">Submit</button>
    </form>
  );
}

export default AdoptionForm;
