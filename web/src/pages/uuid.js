import { useState, useEffect } from 'react';
import '../index.css';
import { v4 as uuidv4 } from 'uuid';

export default () => {
  const [ text, setText ] = useState('');

  useEffect(() => {
    setText(uuidv4());
  }, []);
  
  return (
    <div className="page">
      <h2 className="title"> 🐢 The tool to generate a uuid. 🐢 </h2>
      <div className="title-line"></div>
      <div className="input-group box">
        <p className="label item">UUID: </p>
        <input readOnly className="input item" value={text} placeholder="uuid/v4()"/>
      </div>
      <div className="input-group box">
        <button className="btn btn-default btn-primary" onClick={ () => {
          setText(uuidv4());
        }}> Renew </button>
      </div>
    </div>
  )
};