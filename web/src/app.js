import React, { useState } from 'react';

export default (props) => {
  return (
    <div>
      <div className="header"></div>
      <h1 className="title"> ⚙ ⛓ Coder Kits</h1>
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