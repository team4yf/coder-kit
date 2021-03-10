import { useState } from 'react';
import '../index.css';

export default () => {
  const [ text, setText ] = useState('');
  const [ express, setExpress ] = useState('');

  return (
    <div>
      <div className="input-group box">
        <p className="label item">Regular:</p> 
        <input className="input item" placeholder="/^http$/gi"/>
      </div>
      <div className="input-group box">
        <p className="label item">Text: </p>
        <textarea className="input text item" rows="10">
        </textarea>
      </div>
    </div>
  )
};