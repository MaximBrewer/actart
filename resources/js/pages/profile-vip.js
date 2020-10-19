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
          <div className="col-60">
            <h5 className="h5">{__('Profile VIP')}</h5>
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
      </div>
    </section>
  );
}

export default Profile;
