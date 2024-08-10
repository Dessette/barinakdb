import React, { useState } from 'react';
import axios from 'axios'; // axios'u import edin
import './Form.css';

function StaffForm() {
  const [formData, setFormData] = useState({
    staffId: '',
    staffName: '',
    staffSurname: '',
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
    const dataToSend = {
        personel_id: formData.staffId,
        isim: formData.staffName,
        soyisim: formData.staffSurname,
        telefon: formData.staffPhone,
        mail: formData.staffEmail,
        barinak: formData.shelterId
    };
    axios.post('http://localhost:8000/api/personel/add/', dataToSend)
        .then(response => {
            console.log("Personel başarıyla eklendi:", response.data);
        })
        .catch(error => {
            console.error("Personel eklenirken hata oluştu:", error);
        });
    setFormData({ staffId: '', staffName: '', staffSurname: '', staffPhone: '', staffEmail: '', shelterId: '' });
  };

  return (
    <form onSubmit={handleSubmit} class="form-inline">
      <input type="text" name="staffId" placeholder="Staff ID" onChange={handleChange} />
      <input type="text" name="staffName" placeholder="Staff Name" onChange={handleChange} />
      <input type="text" name="staffSurname" placeholder="Staff Surname" onChange={handleChange} />
      <input type="text" name="staffPhone" placeholder="Staff Phone" onChange={handleChange} />
      <input type="email" name="staffEmail" placeholder="Staff Email" onChange={handleChange} />
      <input type="text" name="shelterId" placeholder="Shelter ID" onChange={handleChange} />
      <button type="submit">Submit</button>
    </form>
  );
}

export default StaffForm;
