import React from 'react';
import ReactDOM from 'react-dom';
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom";
import './index.css';
import App from './app';
import RegularExpress from './pages/regular';
import UUID from './pages/uuid';

ReactDOM.render(
  <Router>
   <Switch>
   <App>
    <Route path="/regular">
      <RegularExpress />
    </Route>
    <Route path="/uuid">
      <UUID />
    </Route>
    <Route exact path="/">
      <RegularExpress />
    </Route>
  </App>
  </Switch>
  </Router>,
  document.getElementById('root'),
)