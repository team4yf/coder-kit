import { useState } from 'react';
import '../index.css';

export default () => {
  const [ text, setText ] = useState('');

  const format = () => {
    setText(JSON.stringify(JSON.parse(text), null, 2));
  }
  return (
    <div className="page">
      <h2 className="title"> 🐢 The tool to format json. 🐢 </h2>
      <div className="title-line"></div>
      <div className="input-group box">
        <p className="label item">Text: </p>
        <textarea className="input text item" rows="10"
          onChange={(event) => setText(event.target.value)}
          value={text}>
        </textarea>
      </div>
      <div className="input-group box">
        <button className="btn btn-primary btn-default" onClick={
         format
        }>
          Format
        </button>
      </div>
    </div>
  )
};