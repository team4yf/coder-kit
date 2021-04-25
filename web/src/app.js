import React from 'react';
import {
  Link,
  NavLink
} from "react-router-dom";
export default (props) => {
  return (
    <div>
      <div className="header"></div>
      <div className="title">
        <ul className="top-bar action-group box">
          <li className="inline-box"><Link to="/">Coder Kits</Link></li>
          <li className="inline-box"><NavLink to="/uuid">UUID</NavLink></li>
          <li className="inline-box"><NavLink to="/jsonFormat">JsonFormat</NavLink></li>
          <li className="inline-box"><NavLink to="/base64">Base64</NavLink></li>
          <li className="inline-box"><NavLink to="/about">About</NavLink></li>
        </ul>
      </div>
      <div className="container">
        <div className="">
          <div className="margin-top-2"></div>
          {props.children}
        </div>
      </div>
      <div className="footer"></div>
    </div>
  )
}