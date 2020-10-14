import React from 'react';
import { Route, Redirect } from 'react-router-dom';
import PropTypes from 'prop-types';
import { useAuth } from '../context/auth';

function GuestRoute({ component: Component, title, ...rest }) {
  let { authenticated } = useAuth();
  return (
    <Route
      {...rest}
      render={props => <Component {...props} participate={rest.participate}/>}
    />
  );
};

GuestRoute.propTypes = {
  component: PropTypes.func.isRequired,
  rest: PropTypes.object,
  location: PropTypes.object,
  title: PropTypes.string
};

export default GuestRoute;
