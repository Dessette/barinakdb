import React, { useState } from 'react';
import './Form.css';

function ShelterForm() {
  const [formData, setFormData] = useState({
    shelterName: '',
    shelterAddress: '',
    shelterPhone: '',
    shelterEmail: ''
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
      <input type="text" name="shelterName" placeholder="Shelter Name" onChange={handleChange} />
      <input type="text" name="shelterAddress" placeholder="Shelter Address" onChange={handleChange} />
      <input type="text" name="shelterPhone" placeholder="Shelter Phone" onChange={handleChange} />
      <input type="email" name="shelterEmail" placeholder="Shelter Email" onChange={handleChange} />
      <button type="submit">Submit</button>
    </form>
  );
}

export default ShelterForm;
