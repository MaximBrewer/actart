import React, { useState, useEffect, useRef } from "react";
import { Link, useHistory } from 'react-router-dom';
import { useAuth } from '../context/auth';
import __ from '../utils/trans';
import { setIntendedUrl } from '../utils/auth';
import AuctionsProfile from "../components/auction/AuctionsProfile";
import Waterfall from "../components/waterfall/Waterfall";


function Profile(props) {
  let { setCurrentUser, setToken, currentUser } = useAuth();

  let history = useHistory();

  const handleLogout = () => {
    setCurrentUser(null);
    setToken(null);
    history.push('/');
    setIntendedUrl(null);
  };

  return (
    <section className="profile-section">
      <div className="container">
        <div className="row announce">
          <div className="col col-xl-40 col-xxl-38">
            <h5 className="h5">{__('You wanted to take part in the auctions:')}</h5>
            <AuctionsProfile />
          </div>
          <div className="col col-xl-20 col-xxl-22">
            <h5 className="h5">{__('Profile data')}</h5>
            <hr />
            <dl>
              <dt>{__('Your ID:')}</dt>
              <dd>#{currentUser.id}</dd>
            </dl>
            <dl>
              <dt>{__('Status:')}</dt>
              <dd>{__(currentUser.role.display_name)}</dd>
            </dl>
            <dl>
              <dt>{__('Full name:')}</dt>
              <dd>{currentUser.name + ` ` + currentUser.surname}</dd>
            </dl>
            <dl>
              <dt>{__('Логин:')}</dt>
              <dd>{currentUser.email}</dd>
            </dl>
            <hr />
            <div
              onClick={handleLogout}>
              <Link
                to="/">
                Logout
                </Link>
            </div>
          </div>
        </div>
        <div className="art-waterfall-wrapper py-5">
          <h5 className="h5">{__('Favorites:')}</h5>
          <div className="act-waterfall">
            <Waterfall
              {...props}
              items={currentUser.favorites}
              data={{
                sortable: true,
                gallery: true,
                tizerView: "gallery",
                view: {
                  xs: 1,
                  sm: 2,
                  md: 2,
                  lg: 3,
                  xl: 4,
                  xxl: 4
                }
              }}
            />
          </div>
        </div>
      </div>
    </section>
  );
}

export default Profile;
