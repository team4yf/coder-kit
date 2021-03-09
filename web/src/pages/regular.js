import { useState } from 'react';
import '../index.css';

export default () => {
  const [ text, setText ] = useState('');
  const [ express, setExpress ] = useState('');

  return (
    <div>
      <div className="input-group box">
        <p className="label item">Regular Express:</p> <input className="input item" />
      </div>
      <div className="input-group box">
        <p className="label item">Text: </p>
        <textarea className="input text item">
        </textarea>
      </div>
    </div>
  )
};