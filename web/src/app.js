import React, { useState } from 'react';
import RegularExpress from './pages/regular';

export default () => {
  return (
    <div>
      <div className="header"></div>
      <div className="container">
        <h2> Coder Kits </h2>
        <div className="">
          <RegularExpress />
        </div>
      </div>
      <div className="footer"></div>
    </div>
  )
}