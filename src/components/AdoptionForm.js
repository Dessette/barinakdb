import React, { useState } from 'react';
import './Form.css';

function AdoptionForm() {
  const [formData, setFormData] = useState({
    adopterName: '',
    adopterPhone: '',
    adopterEmail: '',
    animalId: ''
  });

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value
    });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    // Form submission logic
    console.log(formData);
  };

  return (
    <form onSubmit={handleSubmit} class = "form-inline">
      <input type="text" name="adopterName" placeholder="Adopter Name" onChange={handleChange} />
      <input type="text" name="adopterPhone" placeholder="Adopter Phone" onChange={handleChange} />
      <input type="email" name="adopterEmail" placeholder="Adopter Email" onChange={handleChange} />
      <input type="text" name="animalId" placeholder="Animal ID" onChange={handleChange} />
      <button type="submit">Submit</button>
    </form>
  );
}

export default AdoptionForm;
