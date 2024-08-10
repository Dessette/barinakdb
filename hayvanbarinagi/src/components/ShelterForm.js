import React, { useState } from 'react';

function ShelterForm({ onAddShelter }) {
  const [formData, setFormData] = useState({
    barinak_id: '',
    isim: '',
    adres: '',
    telefon: '',
    mail: ''
  });

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value
    });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    onAddShelter(formData);
    setFormData({ barinak_id: '', isim: '', adres: '', telefon: '', mail: '' });
  };

  return (
    <form onSubmit={handleSubmit} className="form-inline">
      <input type="text" name="barinak_id" placeholder="Shelter ID" onChange={handleChange} />
      <input type="text" name="isim" placeholder="Shelter Name" onChange={handleChange} />
      <input type="text" name="adres" placeholder="Shelter Address" onChange={handleChange} />
      <input type="text" name="telefon" placeholder="Shelter Phone" onChange={handleChange} />
      <input type="email" name="mail" placeholder="Shelter Email" onChange={handleChange} />
      <button type="submit">Submit</button>
    </form>
  );
}

export default ShelterForm;
