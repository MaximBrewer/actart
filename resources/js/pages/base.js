import React, { useState, useEffect, useRef } from "react";
import { Link, useParams, useLocation } from "react-router-dom";
import { useAuth } from '../context/auth';
import __ from '../utils/trans';
import Marquee from '../components/marquee'
import YandexShare from 'react-yandex-share';
import useDocumentTitle from '../components/document-title';
import Parser from "html-react-parser";
import Auctions from "../components/auction/Auctions";
import MovingGallery from "../components/moving/Gallery";
import Carousel from "../components/carousel/Carousel";
import WaterfallAjax from "../components/waterfall/WaterfallAjax";
import client from '../api/client';
import App from "../router";

export default function Base() {
    const [state, setState] = useState({ page: null });

    const { pathname } = useLocation();

    useEffect(() => {
        client('/api/' + window.App.locale + '/page' + pathname)
            .then(({ page }) => setState((prevState) => {
                document.title = page.title;
                return {
                    ...prevState,
                    page
                }
            }))
            .catch(() => null);
    }, [pathname]);

    return (
        state.page ?
            <div className="sticky-wrapper">
                <section id="page" className={state.page.image ? `dotted` : ``}>
                    {/* <div className="background-text">ПРОСТРАНСТВА</div> */}
                    <div className="container">
                        <div className="row pb-2 pb-lg-5">
                            <div className={state.page.image ? `col-xl-30 col-xxl-28` : `col-xl-60`}>
                                <h2 className="h2">{state.page.title}</h2>
                                <hr />
                                <p className="sub_h2 d-none d-xl-block">{Parser(state.page.excerpt)}</p>
                            </div>
                            {state.page.image ?
                                <div className="col-xl-30 col-xxl-32 d-none d-xl-block">
                                    <div className="image-wrapper" style={{ backgroundImage: `url(` + state.page.image + `)` }}></div>
                                </div>
                                : ``}
                        </div>
                        <div className="row">
                            <div className="col-60">
                                {Parser(state.page.body)}
                            </div>
                        </div>
                        <hr />
                        <div className="sharing">
                            <p>{__('Liked? Share with your friends!')}</p>
                            <YandexShare />
                        </div>
                    </div>
                </section>
                <div className="sticky-section"><span>{state.page.title}</span></div>
            </div>
            : ``
    );
}
