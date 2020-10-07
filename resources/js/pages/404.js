import React from 'react';
import AuthNav from '../components/auth-nav';
import GuestNav from '../components/guest-nav';
import { useAuth } from '../context/auth';
import __ from '../utils/trans';

function NotFound() {
  let { authenticated } = useAuth();

  return (
    <section className="page-404">
      <div className="sticky-wrapper">
        <div className="container">
          <div className="h1">{__('404_TITLE')}</div>
          <p>{__('404_TEXT')}</p>
        </div>
        <div className="sticky-section"><span>{__('404_TITLE')}</span></div>
      </div>
    </section>
  );
};

export default NotFound;
