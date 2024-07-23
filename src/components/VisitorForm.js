import React, { useState } from 'react';
import './Form.css';

function VisitorForm() {
  const [formData, setFormData] = useState({
    visitorName: '',
    visitorPhone: '',
    visitorEmail: ''
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
      <input type="text" name="visitorName" placeholder="Visitor Name" onChange={handleChange} />
      <input type="text" name="visitorPhone" placeholder="Visitor Phone" onChange={handleChange} />
      <input type="email" name="visitorEmail" placeholder="Visitor Email" onChange={handleChange} />
      <button type="submit">Submit</button>
    </form>
  );
}

export default VisitorForm;
