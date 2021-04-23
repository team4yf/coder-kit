import { useState } from 'react';
import '../index.css';

export default () => {
  const [ content, setContent ] = useState('');
  const [ text, setText ] = useState('');

  const encode = () => {
    setText(btoa(content));
  }

  const decode = () => {
    setText(atob(content));
  }
  return (
    <div className="page">
      <h2 className="title"> 🐢 The tool to de/encode base64. 🐢 </h2>
      <div className="title-line"></div>
      <div className="input-group box">
        <p className="label item">Source: </p>
        <textarea className="input text item" rows="5" 
          onChange={(event) => setContent(event.target.value)}>
        </textarea>
      </div>
      <div className="input-group box">
        <p className="label item">Text: </p>
        <textarea className="input text item" rows="5" readOnly
          value={text}>
        </textarea>
      </div>
      <div className="input-group box">
        <button className="btn btn-primary btn-default" onClick={
          encode
        }>
          Encode
        </button>
        <button className="btn btn-primary btn-default" onClick={
          decode
        }>
          Decode
        </button>
      </div>
    </div>
  )
};