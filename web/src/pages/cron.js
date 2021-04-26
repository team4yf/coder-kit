import { useState } from 'react';
import '../index.css';
import parser from 'cron-parser';
import dayjs from 'dayjs';

export default () => {
  const [ cron, setCron ] = useState('0 0 * * * *');
  const [ text, setText ] = useState('');

  const getNext5Time = () => {
    const interval = parser.parseExpression(cron);
    try {
      const times = [1,2,3,4,5].map(() => dayjs(interval.next()).format());
      setText(times.join('\n'));
    } catch (error) {
      setText('error cron! maybe a typo!');
    }
    
  }
  return (
    <div className="page">
      <h2 className="title"> 🐢 The tool to get cron. 🐢 </h2>
      <div className="title-line"></div>
      <div className="input-group box">
        <p className="label item">Cron: </p>
        <input className="input item" 
          placeholder="* * * * * *"
          value={cron}
          onChange={(event) => setCron(event.target.value)}       
        />
      </div>
      <div className="input-group box">
        <p className="label item">Next 5 Times: </p>
        <textarea className="input text item" rows="5" readOnly
          value={text}>
        </textarea>
      </div>
      <div className="input-group box">
        <button className="btn btn-primary btn-default" onClick={
         getNext5Time 
        }>
         Parse 
        </button>
      </div>
    </div>
  )
};