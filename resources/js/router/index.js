import React, { useEffect } from "react";
import {
    BrowserRouter as Router,
    Route,
    Switch,
    useHistory
} from "react-router-dom";

import AuthRoute from "./auth-route";
import AdminRoute from "./admin-route";
import { useAuth } from "../context/auth";
import FullPageSpinner from "../components/full-page-spinner";

import Footer from "../components/footer";
import Header from "../components/header";

import Home from "../pages/home";
import Base from "../pages/base";
import Blog from "../pages/blog";
import Modal from "react-modal";
import BlogItem from "../pages/blog-item";
import News from "../pages/news";
import NewsItem from "../pages/news-item";
import Events from "../pages/events";
import EventsItem from "../pages/events-item";
import Authors from "../pages/authors";
import AuthorsItem from "../pages/authors-item";

import Gallery from "../pages/gallery";

import AuctionAdmin from "../components/auction/AuctionAdmin";
import AuctionBase from "../components/auction/AuctionBase";
import AuctionLot from "../components/auction/AuctionLot";
import SearchPage from "../pages/search";
import Auctions from "../pages/auctions";
import AuctionsArchive from "../pages/auctions-archive";

import Profile from "../pages/profile";
import ProfileVIP from "../pages/profile-vip";

import NotFound from "../pages/404";

import LoginModal from "../modals/login";
import RegisterModal from "../modals/register";
import ForgotPasswordModal from "../modals/forgot-password";
import ResetPasswordModal from "../modals/reset-password";
import { getUser } from "../api/auth";
import { setIntendedUrl } from "../utils/auth";

import client from "../api/client";

const scrollToElement = ref => {
    let elem = ref.current;
    if (!elem) return false;
    let toY =
            (elem.getBoundingClientRect().top +
                document.scrollingElement.scrollTop) *
                1 -
            68,
        fromY = document.scrollingElement.scrollTop * 1,
        scrollY = fromY * 1,
        oldTimestamp = null;
    function step(newTimestamp) {
        if (oldTimestamp !== null) {
            if (fromY < toY) {
                scrollY += 100;
                if (scrollY >= toY) {
                    document.scrollingElement.scrollTop = toY;
                    return false;
                }
                document.scrollingElement.scrollTop = scrollY;
            } else {
                scrollY -= 100;
                document.scrollingElement.scrollTop = scrollY;
                if (scrollY <= toY) {
                    document.scrollingElement.scrollTop = toY;
                    return false;
                }
            }
        }
        oldTimestamp = newTimestamp;
        window.requestAnimationFrame(step);
    }
    window.requestAnimationFrame(step);
    return false;
};

Modal.setAppElement("#app");

const customStyles = {
    overlay: {
        zIndex: 1000
    },
    content: {
        top: "50%",
        left: "50%",
        right: "auto",
        bottom: "auto",
        marginRight: "-50%",
        transform: "translate(-50%, -50%)",
        padding: "0",
        border: "0px solid #ccc"
    }
};

function App() {
    const { initializing, currentUser, setCurrentUser, setToken } = useAuth();

    const handleLogout = () => {
        setCurrentUser(null);
        setToken(null);
        setIntendedUrl(null);
    };

    const req = (url, method = "GET", body = null) => {
        return new Promise(function(resolve, reject) {
            client(url, {
                method: method,
                body: body
            })
                .then(resp => resolve(resp))
                .catch(err => reject(err));
        });
    };

    const initState = {
        login: false,
        register: false,
        forgot: false,
        reset: false
    };

    const modals = [
        {
            key: "login",
            component: (
                <LoginModal openModal={openModal} closeModal={closeModal} />
            )
        },
        {
            key: "register",
            component: (
                <RegisterModal openModal={openModal} closeModal={closeModal} />
            )
        },
        {
            key: "forgot",
            component: (
                <ForgotPasswordModal
                    openModal={openModal}
                    closeModal={closeModal}
                />
            )
        },
        {
            key: "reset",
            component: (
                <ResetPasswordModal
                    openModal={openModal}
                    closeModal={closeModal}
                />
            )
        }
    ];

    function openModal(name) {
        setModal(prevState => {
            initState[name] = true;
            return initState;
        });
    }
    function closeModal() {
        setModal(initState);
    }

    const [modal, setModal] = React.useState(initState);

    const participate = (e, auction) => {
        if (!currentUser) {
            e.preventDefault();
            window.participate = auction.id;
            openModal("login", auction.id);
            return false;
        } else {
            for (const a of currentUser.auctions) {
                if (auction.id == a.id) {
                    return true;
                }
            }
            req("/api/" + window.App.locale + "/auction/" + auction.id + "/participate")
                .then(({ user }) => {
                    setCurrentUser(user);
                })
                .catch(() => {
                    e.preventDefault();
                });
        }
    };

    const rest = {
        participate: participate,
        scrollToElement: scrollToElement,
        handleLogout: handleLogout,
        req: req
    };

    return initializing ? (
        <FullPageSpinner />
    ) : (
        <Router>
            <div className="wrapper">
                <Header openModal={openModal} closeModal={closeModal} />
                <main id="main">
                    <Switch>
                        <Route exact path="/about">
                            <Base {...rest} />
                        </Route>
                        <Route exact path="/rules">
                            <Base {...rest} />
                        </Route>

                        <Route exact path="/delivery">
                            <Base {...rest} />
                        </Route>
                        <Route exact path="/contacts">
                            <Base {...rest} />
                        </Route>
                        <Route exact path="/offer">
                            <Base {...rest} />
                        </Route>
                        <Route exact path="/personal">
                            <Base {...rest} />
                        </Route>
                        <Route exact path="/partnership">
                            <Base {...rest} />
                        </Route>
                        <Route exact path="/how-to-buy">
                            <Base {...rest} />
                        </Route>
                        <Route exact path="/how-to-sell">
                            <Base {...rest} />
                        </Route>
                        <Route path="/password/reset/:token">
                            <Home {...rest} openModal={openModal} />
                        </Route>
                        <Route exact path="/">
                            <Home {...rest} openModal={openModal} />
                        </Route>
                        <Route exact path="/blog">
                            <Blog {...rest} />
                        </Route>
                        <Route exact path="/blog/:slug">
                            <BlogItem {...rest} />
                        </Route>

                        <Route exact path="/news">
                            <News {...rest} />
                        </Route>
                        <Route exact path="/news/:slug">
                            <NewsItem {...rest} />
                        </Route>

                        <Route exact path="/events">
                            <Events {...rest} />
                        </Route>
                        <Route exact path="/events/exhibitions">
                            <Events {...rest} />
                        </Route>
                        <Route exact path="/events/workshops">
                            <Events {...rest} />
                        </Route>
                        <Route exact path="/events/:id">
                            <EventsItem {...rest} />
                        </Route>

                        <Route exact path="/authors">
                            <Authors {...rest} />
                        </Route>
                        <Route exact path="/authors/:id">
                            <AuthorsItem {...rest} />
                        </Route>

                        <Route path={`/gallery`}>
                            <Gallery {...rest} />
                        </Route>

                        <Route exact path="/auctions">
                            <Auctions {...rest} />
                        </Route>
                        <Route exact path="/auctions/special">
                            <Auctions {...rest} />
                        </Route>
                        <Route exact path="/auctions/regular">
                            <Auctions {...rest} />
                        </Route>
                        <Route exact path="/auctions/archive">
                            <AuctionsArchive {...rest} />
                        </Route>
                        <Route exact path={`/auctions/:id`}>
                            <AuctionBase {...rest} />
                        </Route>
                        <Route exact path={`/auctions/:id/lot/:lotId`}>
                            <AuctionLot {...rest} />
                        </Route>

                        <Route exact path={`/search`}>
                            <SearchPage {...rest} />
                        </Route>
                        <Route exact path={`/search/:query`}>
                            <SearchPage {...rest} />
                        </Route>

                        <AuthRoute
                            exact
                            path={"/profile/vip"}
                            component={ProfileVIP}
                            {...rest}
                        />
                        <AuthRoute
                            exact
                            path={"/profile"}
                            component={Profile}
                            {...rest}
                        />

                        <AdminRoute
                            exact
                            path={`/auctions/admin/:id`}
                            {...rest}
                            component={AuctionAdmin}
                        />

                        <Route>
                            <NotFound {...rest} />
                        </Route>
                    </Switch>
                </main>
            </div>
            <Footer {...rest} />
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
}

export default App;
