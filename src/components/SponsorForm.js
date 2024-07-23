import React, { useState } from 'react';
import './Form.css';

function SponsorForm() {
  const [formData, setFormData] = useState({
    sponsorName: '',
    sponsorPhone: '',
    sponsorDonation: '',
    sponsorEmail: ''
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
      <input type="text" name="sponsorName" placeholder="Sponsor Name" onChange={handleChange} />
      <input type="text" name="sponsorPhone" placeholder="Sponsor Phone" onChange={handleChange} />
      <input type="number" name="sponsorDonation" placeholder="Donation Amount" onChange={handleChange} />
      <input type="email" name="sponsorEmail" placeholder="Sponsor Email" onChange={handleChange} />
      <button type="submit">Submit</button>
    </form>
  );
}

export default SponsorForm;
