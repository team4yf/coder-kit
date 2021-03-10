import React, { useState } from 'react';
import RegularExpress from './pages/regular';

export default () => {
  return (
    <div>
      <div className="header"></div>
      <h1 className="title"> ⚒  🔩 ⚙ ⛓ 🔧  🔨 Coder Kits </h1>
      <div className="container">
        <div className="">
          <div className="margin-top-2"></div>
          <RegularExpress />
        </div>
      </div>
      <div className="footer"></div>
    </div>
  )
}