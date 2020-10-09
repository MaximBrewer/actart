import React from 'react';
import { Route, Redirect } from 'react-router-dom';
import { setIntendedUrl } from '../utils/auth';
import PropTypes from 'prop-types';
import { useAuth } from '../context/auth';
import AuthNav from '../components/auth-nav';
import Footer from '../components/footer';

function AuthRoute({ component: Component, title, ...rest }) {
  let { authenticated } = useAuth();

  return (
    <Route
      {...rest}
      render={props => {
        if (!authenticated) {
          setIntendedUrl(props.location.pathname);
        }

        return authenticated
          ? (
            <Component {...props} />
          )
          : <Redirect to={{ pathname: '/login', state: { from: props.location } }} />;
      }
      }
    />
  );
};

AuthRoute.displayName = 'Auth Route';

AuthRoute.propTypes = {
  component: PropTypes.func.isRequired,
  rest: PropTypes.object,
  location: PropTypes.object,
  title: PropTypes.string
};

export default AuthRoute;
