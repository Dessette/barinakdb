import React, { useState } from 'react';
import './Form.css';

function StaffForm() {
  const [formData, setFormData] = useState({
    staffName: '',
    staffPhone: '',
    staffEmail: '',
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
      <input type="text" name="staffName" placeholder="Staff Name" onChange={handleChange} />
      <input type="text" name="staffPhone" placeholder="Staff Phone" onChange={handleChange} />
      <input type="email" name="staffEmail" placeholder="Staff Email" onChange={handleChange} />
      <input type="text" name="shelterId" placeholder="Shelter ID" onChange={handleChange} />
      <button type="submit">Submit</button>
    </form>
  );
}

export default StaffForm;
