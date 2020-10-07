import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';

import AuthRoute from './auth-route';
import GuestRoute from './guest-route';
import { useAuth } from '../context/auth';
import FullPageSpinner from '../components/full-page-spinner';

import Footer from '../components/footer';
import Header from '../components/header';

import Home from '../pages/home';
import Base from '../pages/base';
import Blog from '../pages/blog';
import BlogItem from '../pages/blog-item';
import News from '../pages/news';
import NewsItem from '../pages/news-item';
import Events from '../pages/events';
import EventsItem from '../pages/events-item';
import Authors from '../pages/authors';
import AuthorsItem from '../pages/authors-item';

import Gallery from '../components/gallery/Gallery';
import Auction from '../components/auction/Auction';
import Auctions from '../pages/auctions';

import Profile from '../pages/profile';
import Login from '../pages/auth/login';
import Register from '../pages/auth/register';
import ForgotPassword from '../pages/auth/forgot-password';
import ResetPassword from '../pages/auth/reset-password';
import NotFound from '../pages/404';

function App() {
  let { initializing } = useAuth();
  return (
    initializing
      ? <FullPageSpinner />
      : <Router>
        <div className="wrapper">
          <Header />
          <main id="main">
            <Switch>
              <GuestRoute exact path="/" component={Home} />

              <GuestRoute exact path="/blog" component={Blog} />
              <GuestRoute exact path="/blog/:slug" component={BlogItem} />

              <GuestRoute exact path="/news" component={News} />
              <GuestRoute exact path="/news/:slug" component={NewsItem} />

              <GuestRoute exact path="/events" component={Events} />
              <GuestRoute exact path="/events/:id" component={EventsItem} />

              <GuestRoute exact path="/authors" component={Authors} />
              <GuestRoute exact path="/authors/:id" component={AuthorsItem} />

              <GuestRoute path="/gallery" component={Gallery} />
              <GuestRoute exact path="/auctions" component={Auctions} />
              {/* <GuestRoute exact path="/auctions/archive" component={AuctionsArchive} /> */}
              <GuestRoute path="/auctions/:id" component={Auction} />

              <AuthRoute path="/profile/:id" component={Profile} />

              <GuestRoute exact path="/about" component={Base} />
              <GuestRoute exact path="/rules" component={Base} />
              <GuestRoute exact path="/delivery" component={Base} />
              <GuestRoute exact path="/partnership" component={Base} />
              <GuestRoute exact path="/how-to-buy" component={Base} />
              <GuestRoute exact path="/how-to-sell" component={Base} />
              <Route component={NotFound} />
            </Switch>
          </main>
        </div>
        <Footer />
      </Router>
  );
};

export default App;
