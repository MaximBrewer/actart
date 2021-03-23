import React, { useState, useEffect, useRef } from "react";
import { useAuth } from "../context/auth";
import __ from "../utils/trans";
import Marquee from "../components/marquee";
import useDocumentTitle from "../components/document-title";
import Parser from "html-react-parser";
import Auctions from "../components/auction/Auctions";
import MovingGallery from "../components/moving/Gallery";
import Carousel from "../components/carousel/Carousel";
import Waterfall from "../components/waterfall/Waterfall";
import {
    Link,
    useLocation,
    useHistory,
    useRouteMatch,
    useParams
} from "react-router-dom";
import { Hummer, AboutLogo, AboutBgLogo } from "../icons/home";

function Home(props) {
    const { openModal, closeModal } = props;

    useDocumentTitle(__("#HOME_TITLE#"));

    const { token } = useRouteMatch().params;

    useEffect(() => {
        if (token) {
            openModal("reset");
        }
    }, []);

    return (
        <React.Fragment>
            <section className="home-banner">
                <div className="sticky-wrapper">
                    <div className="container">
                        <div className="h5 d-xl-none">
                            {Parser(__("#AUCTIONS_BLOCK_TITLE#"))}
                        </div>
                        <Auctions {...props} />
                    </div>
                    <div className="sticky-section">
                        <span>{__("#AUCTIONS_BLOCK_STICKY#")}</span>
                    </div>
                </div>
            </section>
            <Marquee />
            <section className="gallery-section">
                <div className="sticky-wrapper">
                    <div className="container">
                        <div className="row announce">
                            <div className="col col-md-40 offset-md-20 col-xl-45 offset-xl-15">
                                <h2 className="h1">
                                    {__("#GALLERY_BLOCK_TITLE#")}
                                </h2>
                                <div className="sub_h2 d-none d-xl-block">
                                    {__("#GALLERY_BLOCK_INTROTEXT#")}
                                </div>
                                <Link
                                    to="/how-to-buy"
                                    className="link-how-to-buy"
                                >
                                    {__("GALLERY_BLOCK_HOW_TO_BUY_LINK")}?
                                </Link>
                            </div>
                        </div>
                        <div className="art-waterfall-wrapper">
                            <h3 className="d-none d-md-block pb-4">
                                {__("GALLERY_BLOCK_LATEST_BIDS")}:
                                <Hummer />
                            </h3>
                            <div className="act-waterfall">
                                <Waterfall
                                    {...props}
                                    items={window.App.gallery}
                                    data={{
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
                            <div className="show-more">
                                <div className="dots">•••</div>
                                <Link to="/gallery" className="text">
                                    {__("GALLERY_BLOCK_SHOW_MORE_LINK")}
                                </Link>
                            </div>
                        </div>
                    </div>
                    <div className="sticky-section">
                        <span>{__("GALLERY_BLOCK_STICKY")}</span>
                    </div>
                </div>
            </section>
            <section className="d-none d-md-block popular-categories-section">
                <div className="container">
                    <div className="popular-categories">
                        <h4 className="h4">{__("Popular Categories")}</h4>
                        <div className="d-flex justify-content-between categories">
                            {window.App.popular.map((item, index) => (
                                <Link
                                    key={index}
                                    className={`text-decoration-none d-flex justify-content-center align-items-center`}
                                    to={`/gallery/category/` + item.id}
                                    style={{
                                        backgroundImage: `url(${encodeURI(
                                            item.preview
                                        )})`
                                    }}
                                >
                                    <p className="px-1 text-center text-nowrap w-100 overflow-hidden text-truncate">
                                        {item.title}
                                    </p>
                                </Link>
                            ))}
                        </div>
                        <div className="d-flex justify-content-center align-items-end">
                            <Link to="/gallery" className="btn btn-default">
                                {__("VIEW ALL WORKS")}
                            </Link>
                        </div>
                    </div>
                </div>
            </section>

            <section id="homeAbout">
                <div className="background-text">
                    <AboutLogo />
                </div>
                <div className="sticky-wrapper">
                    <div className="dotted-bg"></div>
                    <div className="background-logo">
                        <AboutBgLogo />
                    </div>
                    <div className="container">
                        <div className="row">
                            <div className="col-xl-20"></div>
                            <div className="col-xl-40">
                                <h2 className="h2">
                                    {__("#HOME_ABOUT_TITLE#")}
                                </h2>
                                <hr />
                                <p className="sub_h2">
                                    {__("#HOME_ABOUT_DESC#")}
                                </p>
                                <p className="sub_h2">
                                    {__("#HOME_ABOUT_DESC2#")}
                                </p>
                                <ul className="list-unstyled d-md-flex justify-content-between">
                                    <li className="h5 h5_underline">
                                        <Link to="/about">
                                            {__("#HOME_LINK_ABOUT#")}
                                        </Link>
                                    </li>
                                    <li className="h5 h5_underline">
                                        <Link to="/spaces#exhibitions">
                                            {__("#HOME_LINK_EXHIBITIONS#")}
                                        </Link>
                                    </li>
                                    <li className="h5 h5_underline">
                                        <Link to="/spaces#workshops">
                                            {__("#HOME_ABOUT_WORKSHOPS#")}
                                        </Link>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        {/* <div className="rolling-strings d-none">
                            <div className="row">
                                <div className="col col-md-50 align-self-end">
                                    <div
                                        className="d-flex"
                                        style={{ transform: "translateX(40%)" }}
                                    >
                                        <div className="h7">{__("#HOME_EDUCATION#")}</div>
                                        <div className="h7">{__("#HOME_EDUCATION#")}</div>
                                        <div className="h7">{__("#HOME_EDUCATION#")}</div>
                                    </div>
                                    <div
                                        className="d-flex"
                                        style={{ transform: "translateX(30%)" }}
                                    >
                                        <div className="h7">{__("#HOME_EDUCATION#")}</div>
                                        <div className="h7">{__("#HOME_EDUCATION#")}</div>
                                        <div className="h7">{__("#HOME_EDUCATION#")}</div>
                                    </div>
                                    <div
                                        className="d-flex"
                                        style={{ transform: "translateX(55%)" }}
                                    >
                                        <div className="h7">
                                            {__("#HOME_EDUCATION#")}
                                        </div>
                                        <div className="h7">{__("#HOME_EDUCATION#")}</div>
                                    </div>
                                </div>
                            </div>
                        </div> */}
                    </div>
                    <div className="sticky-section">
                        <span>{__("#STICKY_ABOUT_THE_PROJECT#")}</span>
                    </div>
                </div>
            </section>
            <Marquee />
            <section id="announces">
                <div className="sticky-wrapper">
                    <div className="container">
                        <div className="row announce">
                            <div className="col-xl-40 col-xxl-38">
                                <h2 className="h2">
                                    {Parser(__("#HOME_EVENTS_TITLE#"))}
                                </h2>
                                <p className="sub_h2 d-none d-xl-block">
                                    {__("#HOME_EVENTS_DESC#")}
                                </p>
                                <p className="sub_h2 d-none d-xl-block">
                                    {__("#HOME_EVENTS_DESC2#")}
                                </p>
                            </div>
                            <div className="col-xl-20 col-xxl-22 d-none d-xl-block">
                                <h3 className="h3">{__("#ADDRESSES#")}:</h3>
                                <dl>
                                    {window.App.spaces.map((item, index) => (
                                        <React.Fragment key={index}>
                                            <dt>{item.title}</dt>
                                            <dd>{item.address}</dd>
                                        </React.Fragment>
                                    ))}
                                </dl>
                            </div>
                        </div>
                        <div className="announce-slider-wrapper">
                            <div
                                className="announce-slider act-carousel"
                                id="announceSlider"
                            >
                                <Carousel
                                    items={App.events}
                                    data={{
                                        entity: "events",
                                        limit: {
                                            xs: 4,
                                            sm: 4,
                                            md: 4,
                                            lg: 12,
                                            xl: 24,
                                            xxl: 24
                                        },
                                        view: {
                                            xs: 1,
                                            sm: 1,
                                            md: 2,
                                            lg: 3,
                                            xl: 4,
                                            xxl: 4
                                        },
                                        scroll: {
                                            xs: 1,
                                            sm: 1,
                                            md: 2,
                                            lg: 3,
                                            xl: 4,
                                            xxl: 4
                                        },
                                        tizerView: "event",
                                        minView: "md"
                                    }}
                                />
                            </div>
                        </div>
                    </div>
                    <div className="sticky-section">
                        <span>{__("#STICKY_ANNOUNCES#")}</span>
                    </div>
                </div>
            </section>
            <section id="gallery">
                <MovingGallery />
            </section>
            <section id="news">
                <div className="background-text">{__("#HOME_NEWS_TITLE#")}</div>
                <div className="sticky-wrapper">
                    <div className="container">
                        <div className="h5 d-xl-none">{__("#HOME_H5_BLOG_NEWS#")}</div>
                        <div className="news-slider-wrapper">
                            <div
                                className="news-slider act-carousel"
                                id="newsSlider"
                            >
                                <Carousel
                                    items={App.posts}
                                    data={{
                                        entity: "posts",
                                        limit: {
                                            xs: 6,
                                            sm: 6,
                                            md: 12,
                                            lg: 12,
                                            xl: 24,
                                            xxl: 24
                                        },
                                        view: {
                                            xs: 1,
                                            sm: 1,
                                            md: 3,
                                            lg: 3,
                                            xl: 4,
                                            xxl: 4
                                        },
                                        scroll: {
                                            xs: 1,
                                            sm: 1,
                                            md: 3,
                                            lg: 3,
                                            xl: 4,
                                            xxl: 4
                                        },
                                        tizerView: "post",
                                        minView: "sm"
                                    }}
                                />
                            </div>
                        </div>
                    </div>
                    <div className="sticky-section">
                        <span>{__("#RECENT_NOTES#")}</span>
                    </div>
                </div>
            </section>
            
            <section id="experts" className="d-none d-sm-none d-md-block">
                {/* <div>
                    <div className="sticky-wrapper">
                        <div className="container">
                            <h2 className="h2">{__("#HOME_EXPERTS_TITLE#")}</h2>
                            <div className="experts-slider-wrapper">
                                <div
                                    className="experts-slider act-carousel"
                                    id="expertsSlider"
                                >
                                    <Carousel
                                        items={App.experts}
                                        data={{
                                            entity: "experts",
                                            limit: {
                                                xs: 96,
                                                sm: 96,
                                                md: 96,
                                                lg: 96,
                                                xl: 96,
                                                xxl: 96
                                            },
                                            view: {
                                                xs: 1,
                                                sm: 1,
                                                md: 3,
                                                lg: 4,
                                                xl: 6,
                                                xxl: 6
                                            },
                                            scroll: {
                                                xs: 1,
                                                sm: 1,
                                                md: 3,
                                                lg: 4,
                                                xl: 6,
                                                xxl: 6
                                            },
                                            tizerView: "expert",
                                            minView: "sm"
                                        }}
                                    />
                                </div>
                            </div>
                        </div>
                        <div className="sticky-section">
                            <span>{__("#HOME_EXPERTS_STICKY#")}</span>
                        </div>
                    </div>
                </div> */}
            </section>
            <section className="mb-5">
                <div className="container mb-5">
                    <div className="footer-buttons">
                        <Link to="/auctions" className="btn btn-default">
                            {__("#LINK_VIEW_AUCTIONS#")}
                        </Link>
                        <Link to="/gallery" className="btn btn-primary">
                            {__("#LINK_VIEW_GALLERY#")}
                        </Link>
                    </div>
                </div>
            </section>
            <Marquee />
        </React.Fragment>
    );
}

export default Home;
