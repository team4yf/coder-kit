import React from 'react';
import ReactDOM from 'react-dom';
import {
  BrowserRouter as Router,
  Switch,
  Route
} from "react-router-dom";
import './index.css';
import App from './app';
import RegularExpress from './pages/regular';
import UUID from './pages/uuid';
import About from './pages/about';
import Base64 from './pages/base64';

ReactDOM.render(
  <Router
  forceRefresh={false}>
   <Switch>
   <App>
    <Route path="/regular">
      <RegularExpress />
    </Route>
    <Route path="/uuid">
      <UUID />
    </Route>
    <Route path="/base64">
      <Base64 />
    </Route>
    <Route path="/about">
      <About />
    </Route>
    <Route path="/home">
      <UUID />
    </Route>
    <Route exact path="/">
      <UUID />
    </Route>
  </App>
  </Switch>
  </Router>,
  document.getElementById('root'),
)