import React, { useState, useEffect, useRef } from "react";
import { Link, useParams, useLocation, NavLink, useHistory } from 'react-router-dom';
import { useAuth } from '../context/auth';
import __ from '../utils/trans';
import Marquee from '../components/marquee'
import Announce from '../components/announce'
import YandexShare from 'react-yandex-share';
import useDocumentTitle from '../components/document-title';
import Parser from "html-react-parser";
import Auctions from "../components/auction/Auctions";
import MovingGallery from "../components/moving/Gallery";
import Carousel from "../components/carousel/Carousel";
import WaterfallAjax from "../components/waterfall/WaterfallAjax";
import client from '../api/client';
import App from "../router";
import { setIntendedUrl } from '../utils/auth';


function Profile() {
  let { setCurrentUser, setToken, currentUser } = useAuth();
  console.log(currentUser)

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
            <div id="actAuctionsProfile"></div>
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
          <div className="act-waterfall" data-entity="favorites" data-action="add" data-tizer-view="gallery"
            data-view='{"xs":1,"sm":2,"md":2,"lg":3,"xl":3,"xxl":4}'
            data-limit='{"xs":48,"sm":48,"md":48,"lg":48,"xl":48,"xxl":48}'>
          </div>
        </div>
      </div>
    </section>
  );
}

export default Profile;
