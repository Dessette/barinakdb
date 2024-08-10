import React, { useState } from 'react';
import './Form.css';

function AnimalForm({onAddAnimal}) {
  const [formData, setFormData] = useState({
    hayvan_id: '',
    isim: '',
    tur: '',
    cins: '',
    cinsiyet: '',
    yas: '',
    saglik_durumu: '',
    sahiplenme_durumu: '',
    giris_tarihi: '',
    barinak: ''
  });

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value
    });
  };

  const handleRefresh = () => {
    window.location.reload();
  }

  const handleSubmit = (e) => {
    e.preventDefault();
    onAddAnimal(formData);
    setFormData({ hayvan_id: '', isim: '', tur: '', cins: '', cinsiyet: '', yas: '', saglik_durumu: '', sahiplenme_durumu: '', giris_tarihi: '', barinak: ''})
  };

  return (
    <form onSubmit={handleSubmit} className="form-inline">
      <input type="text" name="hayvan_id" placeholder="Animal ID" onChange={handleChange} />
      <input type="text" name="isim" placeholder="Name" onChange={handleChange} />
      <input type="text" name="tur" placeholder="Species" onChange={handleChange} />
      <input type="text" name="cins" placeholder="Breed" onChange={handleChange} />
      <input type="text" name="cinsiyet" placeholder="Gender" onChange={handleChange} />
      <input type="number" name="yas" placeholder="Age" onChange={handleChange} />
      <input type="text" name="saglik_durumU" placeholder="Health Status" onChange={handleChange} />
      <input type="text" name="sahiplenme_durum" placeholder="Adoption Status" onChange={handleChange} />
      <input type="date" name="giris_tarihi" onChange={handleChange} />
      <input type="text" name="barinak" placeholder="Shelter ID" onChange={handleChange} />
      <button type="submit">Submit</button>
    </form>
  );
}


export default AnimalForm;