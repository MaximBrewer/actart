import React from 'react';
import { BrowserRouter as Router, Route, Switch, useHistory } from 'react-router-dom';

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

import GalleryLot from "../components/gallery/Lot";
import GalleryArchive from "../components/gallery/Archive";
import GalleryCategory from "../components/gallery/Category";

import AuctionBase from "../components/auction/AuctionBase";
import AuctionLot from "../components/auction/AuctionLot";
import Auctions from '../pages/auctions';

import Profile from '../pages/profile';
import NotFound from '../pages/404';

import LoginModal from '../modals/login';
import RegisterModal from '../modals/register';
import ForgotPasswordModal from '../modals/forgot-password';
import ResetPasswordModal from '../modals/reset-password';

import client from '../api/client';

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
  const { initializing, currentUser, setCurrentUser } = useAuth();
  const history = useHistory();

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

  function openModal(name) {
    setModal(prevState => {
      initState[name] = true
      return initState
    })
  }
  function closeModal() {
    setModal(initState)
  }

  const [modal, setModal] = React.useState(initState);

  function participate(e, id) {
    if (!currentUser) {
      e.preventDefault();
      openModal('login');
      return false;
    }
    else {
      for (const a of currentUser.auctions) {
        if (id == a.id) {
          return true;
        }
      }
      return client('/api/auction/' + id + '/participate')
        .then(({ res }) => {
          setCurrentUser(res.user)
          return true;
        })
        .catch(() => {
          e.preventDefault();
          return false;
        });
    }
  }

  const rest = {
    participate: participate
  }

  return (
    initializing
      ? <FullPageSpinner />
      : <Router>
        <div className='wrapper'>
          <Header
            openModal={openModal}
            closeModal={closeModal}
          />
          <main id='main'>
            <Switch>
              <Route exact path='/about'><Base  {...rest} /></Route>
              <Route exact path='/rules'><Base  {...rest} /></Route>
              <Route exact path='/delivery'><Base  {...rest} /></Route>
              <Route exact path='/partnership'><Base  {...rest} /></Route>
              <Route exact path='/how-to-buy'><Base  {...rest} /></Route>
              <Route exact path='/how-to-sell'><Base  {...rest} /></Route>

              <Route exact path='/'><Home {...rest} /></Route>

              <Route exact path='/blog'><Blog {...rest} /></Route>
              <Route exact path='/blog/:slug'><BlogItem {...rest} /></Route>

              <Route exact path='/news'><News {...rest} /></Route>
              <Route exact path='/news/:slug'><NewsItem {...rest} /></Route>


              <Route exact path='/events'><Events {...rest} /></Route>
              <Route exact path='/events/exhibitions'><Events {...rest} /></Route>
              <Route exact path='/events/workshops'><Events {...rest} /></Route>
              <Route exact path='/events/:id'><EventsItem {...rest} /></Route>


              <Route exact path='/authors' component={Authors} {...rest} />
              <Route exact path='/authors/:id' component={AuthorsItem} {...rest} />

              <Route exact path={`/gallery`}><GalleryCategory {...rest} showLink={false} /></Route>
              <Route exact path={`/gallery/lot/:id`}><GalleryLot {...rest} showLink={true} /></Route>
              <Route exact path={`/gallery/category/:id`}><GalleryCategory {...rest} showLink={true} /></Route>
              <Route exact path={`/gallery/archive`}><GalleryArchive {...rest} showLink={true} /></Route>

              <Route exact path='/auctions' component={Auctions} {...rest} />
              <Route exact path='/auctions/special' component={Auctions} {...rest} />
              <Route exact path='/auctions/regular' component={Auctions} {...rest} />
              <Route exact path='/auctions/archive' component={Auctions} {...rest} />

              <Route exact path={`/auctions/:id`}><AuctionBase {...rest} /></Route>
              <Route exact path={`/auctions/:id/lot/:lotId`}><AuctionLot {...rest} /></Route>

              <AuthRoute path='/profile' component={Profile} {...rest} />
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
