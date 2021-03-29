import { useState } from 'react';
import '../index.css';

export default () => {
  const [ text, setText ] = useState('');

  return (
    <div className="page">
      <h2 className="title"> 🐢 The tool to generate a uuid. 🐢 </h2>
      <div className="title-line"></div>
      <div className="input-group box">
        <p className="label item">UUID: </p>
        <input readonly className="input item" placeholder=""/>
      </div>
    </div>
  )
};