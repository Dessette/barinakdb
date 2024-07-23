import React, { useState } from 'react';
import './Form.css';

function AnimalForm() {
  const [formData, setFormData] = useState({
    name: '',
    species: '',
    breed: '',
    gender: '',
    age: '',
    healthStatus: '',
    adoptionStatus: '',
    entryDate: '',
    shelterId: ''
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
      <input type="text" name="name" placeholder="Name" onChange={handleChange} />
      <input type="text" name="species" placeholder="Species" onChange={handleChange} />
      <input type="text" name="breed" placeholder="Breed" onChange={handleChange} />
      <input type="text" name="gender" placeholder="Gender" onChange={handleChange} />
      <input type="number" name="age" placeholder="Age" onChange={handleChange} />
      <input type="text" name="healthStatus" placeholder="Health Status" onChange={handleChange} />
      <input type="text" name="adoptionStatus" placeholder="Adoption Status" onChange={handleChange} />
      <input type="date" name="entryDate" onChange={handleChange} />
      <input type="text" name="shelterId" placeholder="Shelter ID" onChange={handleChange} />
      <button type="submit">Submit</button>
    </form>
  );
}

export default AnimalForm;
