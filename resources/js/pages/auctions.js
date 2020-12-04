import React, { useEffect, useRef } from "react";
import { Link, useLocation } from "react-router-dom";
import __ from "../utils/trans";
import Marquee from "../components/marquee";
import Subscribe from "../components/subscribe";
import useDocumentTitle from "../components/document-title";
import AuctionsList from "../components/auction/AuctionsList";
import InViewMonitor from "react-inview-monitor"

export default function AuctionsPage(props) {
    useDocumentTitle(__("AUCTIONS_PAGE_TITLE"));
    const { pathname } = useLocation();

    const { scrollToElement } = props;

    useEffect(() => {
        switch (pathname) {
            case "/auctions/special":
                document.title = __("SPECIAL_AUCTIONS_PAGE_TITLE");
                scrollToElement(specialEl);
                break;
            case "/auctions/regular":
                document.title = __("REGULAR_AUCTIONS_PAGE_TITLE");
                scrollToElement(regularEl);
                break;
            default:
                document.title = __("AUCTIONS_PAGE_TITLE");
                break;
        }
    }, [pathname]);

    const regularEl = useRef(null);
    const specialEl = useRef(null);

    return (
        <React.Fragment>
            <div className="sticky-wrapper">
                <section
                    className="auctions-section regular-list"
                    ref={regularEl}
                >
                    <div className="container">
                        <div className="row announce mb-xl-5">
                            <div className="col col-xl-40 col-xxl-38">
                                <h2 className="h1">{__("REGULAR_AUCTION_TITLE")}</h2>
                                <div className="sub_h2 d-none d-xl-block">
                                    {__("REGULAR_AUCTION_SUBTITLE")}
                                </div>
                            </div>
                            <div className="col col-xl-20 col-xxl-22 d-none d-xl-block">
                                <InViewMonitor
                                    classNameNotInView='vis-hidden'
                                    classNameInView='animated fadeInUp'
                                    repeatOnInView={true}
                                >
                                    <a
                                        className="see-other"
                                        href="#"
                                        onClick={e => scrollToElement(specialEl, e)}
                                    >
                                        <div className="h5">
                                            {__("THEMED_AUCTION_TITLE")}
                                        </div>
                                        <svg
                                            viewBox="0 0 36 39"
                                            fill="none"
                                            xmlns="http://www.w3.org/2000/svg"
                                        >
                                            <path
                                                d="M3 17.8378L18 32.4324L33 17.8378"
                                                stroke="white"
                                                strokeWidth="8"
                                            />
                                            <path
                                                d="M17.5947 30.8108L17.5947 -2.2471e-05"
                                                stroke="white"
                                                strokeWidth="8"
                                            />
                                        </svg>
                                    </a>
                                </InViewMonitor>
                            </div>
                        </div>
                        <div className="act-auctions-list">
                            <AuctionsList attr={"regular"} {...props} />
                        </div>
                    </div>
                </section>
                <section
                    className="auctions-section special-list"
                    ref={specialEl}
                >
                    <div className="container">
                        <div className="row announce mb-xl-5">
                            <div className="col col-xl-40 col-xxl-38">
                                <h2 className="h1">{__("THEMED_AUCTION_TITLE")}</h2>
                                <div className="sub_h2 d-none d-xl-block">
                                    {__("THEMED_AUCTION_SUBTITLE")}
                                </div>
                            </div>
                            <div className="col col-xl-20 col-xxl-22 d-none d-xl-block">
                                <InViewMonitor
                                    classNameNotInView='vis-hidden'
                                    classNameInView='animated fadeInUp'
                                    repeatOnInView={true}
                                >
                                    <a
                                        className="see-other"
                                        href="#"
                                        onClick={e => scrollToElement(regularEl, e)}
                                    >
                                        <div className="h5">
                                            {__("REGULAR_AUCTION_TITLE")}
                                        </div>
                                        <svg
                                            viewBox="0 0 36 39"
                                            fill="none"
                                            xmlns="http://www.w3.org/2000/svg"
                                        >
                                            <path
                                                d="M33 20.5946L18 6L3 20.5946"
                                                stroke="white"
                                                strokeWidth="8"
                                            />
                                            <path
                                                d="M18.4053 7.62158L18.4053 38.4324"
                                                stroke="white"
                                                strokeWidth="8"
                                            />
                                        </svg>
                                    </a>
                                </InViewMonitor>
                            </div>
                        </div>
                        <div className="act-auctions-list" data-attr="special">
                            <AuctionsList attr={"special"} {...props} />
                        </div>
                    </div>
                </section>
                <div className="sticky-section">
                    <span>{__("closest auctions")}</span>
                </div>
            </div>
            <section className="auctions-section mb-5">
                <div className="container">
                    <div className="text-center">
                        <Link
                            to="/auctions/archive"
                            className="btn btn-default"
                        >
                            {__("ARCHIVE OF AUCTIONS")}
                        </Link>
                    </div>
                </div>
            </section>
            <section className="subscribe-section">
                <div className="container">
                    <div className="row announce justify-content-center">
                        <div className="col col-xl-40">
                            <div className="text-center">
                                <Subscribe {...props} />
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section className="auctions-section d-none d-md-block py-5">
                <div className="container">
                    <div className="row announce justify-content-center">
                        <div className="col col-xl-40">
                            <div className="text-center sub_h1">
                                {__(
                                    "You can also purchase selected works by contemporary Russian authors in our permanent online gallery."
                                )}
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section className="d-none d-md-block popular-categories-section">
                <div className="pt-5 mb-5">
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
                                            backgroundImage:
                                                `url(` + item.preview + `)`
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
                </div>
            </section>
            <Marquee />
        </React.Fragment>
    );
}
