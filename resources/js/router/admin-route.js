import React from 'react';
import { Route, Redirect } from 'react-router-dom';
import { setIntendedUrl } from '../utils/auth';
import PropTypes from 'prop-types';
import { useAuth } from '../context/auth';

function AdminRoute({ component: Component, title, ...rest }) {
  let { authenticated, administration } = useAuth();

  return (
    <Route
      {...rest}
      render={props => {
        if (!administration) {
          setIntendedUrl(props.location.pathname);
        }

        return administration
          ? (
            <Component {...rest} {...props} participate={rest.participate} />
          )
          : <Redirect to={{ pathname: '/', state: { from: props.location } }} />;
      }
      }
    />
  );
};

AdminRoute.propTypes = {
  component: PropTypes.func.isRequired,
  rest: PropTypes.object,
  location: PropTypes.object,
  title: PropTypes.string
};

export default AdminRoute;
