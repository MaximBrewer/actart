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
import Modal from 'react-modal';
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
import NotFound from '../pages/404';

import LoginModal from '../modals/login';
import RegisterModal from '../modals/register';
import ForgotPasswordModal from '../modals/forgot-password';
import ResetPasswordModal from '../modals/reset-password';

Modal.setAppElement('#app')

const customStyles = {
  overlay: {
    zIndex: 1000
  },
  content: {
    top: '50%',
    left: '50%',
    right: 'auto',
    bottom: 'auto',
    marginRight: '-50%',
    transform: 'translate(-50%, -50%)',
    padding: '0',
    border: '0px solid #ccc'
  }
};

function App() {
  let { initializing } = useAuth();

  function openModal(name) {
    setModal(prevState => {
      initState[name] = true
      return initState
    })
  }
  const initState = {
    login: false,
    register: false,
    forgot: false,
    reset: false,
  }

  const modals = [
    { key: 'login', component: <LoginModal openModal={openModal} closeModal={closeModal} /> },
    { key: 'register', component: <RegisterModal openModal={openModal} closeModal={closeModal} /> },
    { key: 'forgot', component: <ForgotPasswordModal openModal={openModal} closeModal={closeModal} /> },
    { key: 'reset', component: <ResetPasswordModal openModal={openModal} closeModal={closeModal} /> },
  ]

  function closeModal() {
    setModal(initState)
  }

  const [modal, setModal] = React.useState(initState);

  return (
    initializing
      ? <FullPageSpinner />
      : <Router>
        <div className="wrapper">
          <Header
            openModal={openModal}
            closeModal={closeModal}
          />
          <main id="main">
            <Switch>
              <GuestRoute exact path="/" component={Home} />

              <GuestRoute exact path="/blog" component={Blog} />
              <GuestRoute exact path="/blog/:slug" component={BlogItem} />

              <GuestRoute exact path="/news" component={News} />
              <GuestRoute exact path="/news/:slug" component={NewsItem} />

              <GuestRoute exact path="/events" component={Events} />
              <GuestRoute exact path="/events/exhibitions" component={Events} />
              <GuestRoute exact path="/events/workshops" component={Events} />
              <GuestRoute exact path="/events/:id" component={EventsItem} />

              <GuestRoute exact path="/authors" component={Authors} />
              <GuestRoute exact path="/authors/:id" component={AuthorsItem} />

              <GuestRoute path="/gallery" component={Gallery} />
              <GuestRoute exact path="/auctions" component={Auctions} />
              <GuestRoute exact path="/auctions/special" component={Auctions} />
              <GuestRoute exact path="/auctions/regular" component={Auctions} />
              <GuestRoute exact path="/auctions/archive" component={Auctions} />
              <GuestRoute path="/auctions/:id" component={Auction} />

              <GuestRoute exact path="/about" component={Base} />
              <GuestRoute exact path="/rules" component={Base} />
              <GuestRoute exact path="/delivery" component={Base} />
              <GuestRoute exact path="/partnership" component={Base} />
              <GuestRoute exact path="/how-to-buy" component={Base} />
              <GuestRoute exact path="/how-to-sell" component={Base} />

              <AuthRoute path="/profile" component={Profile} />
              <Route component={NotFound} />
            </Switch>
          </main>
        </div>
        <Footer />
        {modals.map((item, index) => (
          <Modal
            key={index}
            isOpen={modal[item.key]}
            onRequestClose={closeModal}
            style={customStyles}
            shouldCloseOnOverlayClick={true}
          >
            {item.component}
          </Modal>
        ))}
      </Router>
  );
};

export default App;
