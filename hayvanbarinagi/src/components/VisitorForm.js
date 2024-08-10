import React, { useState } from 'react';
import './Form.css';
import axios from 'axios';

function VisitorForm({ onAddVisitor }) {
  const [formData, setFormData] = useState({
    visitorId: '',  // ID alanı eklendi
    visitorName: '',
    visitorSurname: '',
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
    const dataToSend = {
        ziyaretci_id: formData.visitorId,
        isim: formData.visitorName,
        soyisim: formData.visitorSurname,
        telefon: formData.visitorPhone,
        mail: formData.visitorEmail
    };
    axios.post('http://localhost:8000/api/ziyaretci/add/', dataToSend)
        .then(response => {
            console.log("Ziyaretçi başarıyla eklendi:", response.data);
        })
        .catch(error => {
            console.error("Ziyaretçi eklenirken hata oluştu:", error);
        });
};


  return (
    <form onSubmit={handleSubmit} className="form-inline">
      <input type="text" name="visitorId" placeholder="Visitor ID" onChange={handleChange} /> 
      <input type="text" name="visitorName" placeholder="Visitor Name" onChange={handleChange} />
      <input type="text" name="visitorSurname" placeholder="Visitor Surname" onChange={handleChange} />
      <input type="text" name="visitorPhone" placeholder="Visitor Phone" onChange={handleChange} />
      <input type="email" name="visitorEmail" placeholder="Visitor Email" onChange={handleChange} />
      <button type="submit">Submit</button>
    </form>
  );
}

export default VisitorForm;
