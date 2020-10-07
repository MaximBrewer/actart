import React, { useState, useEffect, useRef } from "react";
import { Link, useParams, useLocation } from "react-router-dom";
import { useAuth } from '../context/auth';
import __ from '../utils/trans';
import Marquee from '../components/marquee'
import Announce from '../components/announce'
import Subscribe from '../components/subscribe'
import YandexShare from 'react-yandex-share';
import useDocumentTitle from '../components/document-title';
import Parser from "html-react-parser";
import Auctions from "../components/auction/Auctions";
import MovingGallery from "../components/moving/Gallery";
import Carousel from "../components/carousel/Carousel";
import WaterfallAjax from "../components/waterfall/WaterfallAjax";
import client from '../api/client';
import App from "../router";
import AuctionsList from "../components/auction/AuctionsList";

export default function AuctionsPage() {
    const [state, setState] = useState({ page: null });

    const participate = () => { }
    const { pathname } = useLocation();
    useDocumentTitle(__('BLOG_TITLE'));

    return (
        <React.Fragment>
            <div className="sticky-wrapper">
                <section className="auctions-section regular-list" id="regularAuctionsList">
                    <div className="container">
                        <div className="row announce mb-xl-5">
                            <div className="col col-xl-40 col-xxl-38">
                                <h2 className="h1">{__('Regular auctions')}</h2>
                                <div className="sub_h1 d-none d-xl-block">
                                    {__('Permanent exhibition and sale of works by young authors, on the auction platform. Follow, choose, bargain, collect your collection. Weekly update.')}
                                </div>
                            </div>
                            <div className="col col-xl-20 col-xxl-22 d-none d-xl-block">
                                <a className="see-other" href="#" onclick="scrollToElement(this);return false;"
                                    data-id="specialAuctionsList">
                                    <div className="text-14">{__("see also:")}</div>
                                    <div className="h5">{__('Themed auctions')}</div>
                                    <svg viewBox="0 0 36 39" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M3 17.8378L18 32.4324L33 17.8378" stroke="white" strokeWidth="8" />
                                        <path d="M17.5947 30.8108L17.5947 -2.2471e-05" stroke="white" strokeWidth="8" />
                                    </svg>
                                </a>
                            </div>
                        </div>
                        <div className="act-auctions-list">
                            <AuctionsList
                                attr={'regular'}
                                participate={participate}
                            />
                        </div>
                    </div>
                </section>
                <section className="auctions-section special-list" id="specialAuctionsList">
                    <div className="container">
                        <div className="row announce mb-xl-5">
                            <div className="col col-xl-40 col-xxl-38">
                                <h2 className="h1">{__('Themed auctions')}</h2>
                                <div className="sub_h1 d-none d-xl-block">
                                    {__('Permanent exhibition and sale of works by young authors, on the auction platform. Follow, choose, bargain, collect your collection. Weekly update.')}
                                </div>
                            </div>
                            <div className="col col-xl-20 col-xxl-22 d-none d-xl-block">
                                <a className="see-other" href="#" onclick="scrollToElement(this);return false;"
                                    data-id="regularAuctionsList">
                                    <div className="text-14">{__("see also:")}</div>
                                    <div className="h5">{__('Regular auctions')}</div>
                                    <svg viewBox="0 0 36 39" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M33 20.5946L18 6L3 20.5946" stroke="white" strokeWidth="8" />
                                        <path d="M18.4053 7.62158L18.4053 38.4324" stroke="white" strokeWidth="8" />
                                    </svg>
                                </a>
                            </div>
                        </div>
                        <div className="act-auctions-list" data-attr="special">
                            <AuctionsList
                                attr={'special'}
                                participate={participate}
                            />
                        </div>
                    </div>
                </section>
                <div className="sticky-section mt-5"><span>{__('closest auctions')}</span></div>
            </div>
            <section className="auctions-section">
                <div className="container">
                    <div className="row announce">
                        <div className="col col-xl-40 col-xxl-38">
                        </div>
                        <div className="col col-xl-20 col-xxl-22 text-center">
                            <a href="/auctions/archive" className="btn btn-default">{__('ARCHIVE OF AUCTIONS')}</a>
                        </div>
                    </div>
                </div>
            </section>
            <section className="subscribe-section">
                <div className="container">
                    <div className="row announce justify-content-center">
                        <div className="col col-xl-40">
                            <div className="text-center">
                                <Subscribe />
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section className="auctions-section d-none d-md-block">
                <div className="container">
                    <div className="row announce justify-content-center">
                        <div className="col col-xl-40">
                            <div className="text-center sub_h1">
                                {__('You can also purchase selected works by contemporary Russian authors in our permanent online gallery.')}
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section className="d-none d-md-block popular-categories-section">
                <div className="pt-5 mb-5">
                    <div className="container">
                        <div className="popular-categories">
                            <h4 className="h4">{__('Popular Categories')}</h4>
                            <div className="d-flex justify-content-between categories">
                                {/* @widget('popular_categories') */}
                            </div>
                            <div className="d-flex justify-content-center align-items-end">
                                <a href="/gallery" className="btn btn-default">{__('VIEW ALL WORKS')}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <Marquee />
        </React.Fragment>
    );
}
