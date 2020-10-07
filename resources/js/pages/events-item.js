import React, { useState, useEffect, useRef } from "react";
import { Link, useParams, useLocation } from "react-router-dom";
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

export default function Eventtem() {
    const [state, setState] = useState({ event: null });
    const { id } = useParams();

    useDocumentTitle(__('EVENTS_TITLE'));

    useEffect(() => {
        client('/api/' + window.App.locale + '/event/' + id)
            .then(({ event }) => setState((prevState) => {
                document.title = event.title;
                return {
                    ...prevState,
                    event
                }
            }))
            .catch(() => null);
    }, [id]);

    return (
        state.event ?
            <React.Fragment>
                <div className="sticky-wrapper">
                    <section id="page">
                        <div className="container">
                            <div className="row pb-2 pb-lg-5">
                                <div className="col-xl-30 col-xxl-28">
                                    <h2 className="h2">{state.event.title}</h2>
                                    <hr />
                                    <p className="sub_h2 d-none d-xl-block">{state.event.excerpt}</p>
                                </div>
                                <div className="col-xl-30 col-xxl-32 d-none d-xl-block">
                                    <div className="image-wrapper" style={{ backgroundImage: `url(` + state.event.image + `)` }}></div>
                                </div>
                            </div>
                            <div className="row">
                                <div className="col-60">
                                    {Parser(state.event.body)}
                                </div>
                            </div>
                            <hr />
                            <div className="sharing">
                                <p>{__('Liked? Share with your friends!')}</p>
                                <YandexShare />
                            </div>
                        </div>
                    </section>
                    <div className="sticky-section"><span>{state.event.title}</span></div>
                </div>
                <section id="gallery"><MovingGallery /></section>
                <section className="announces">
                    <div className="container">
                        <div className="h2">{__('See also')}</div>
                        <div className="announce-slider-wrapper">
                            <div className="announce-slider act-carousel">
                                <Carousel items={App.events} data={{
                                    entity: "events",
                                    limit: { "xs": 4, "sm": 4, "md": 4, "lg": 12, "xl": 24, "xxl": 24 },
                                    view: { "xs": 1, "sm": 1, "md": 2, "lg": 3, "xl": 4, "xxl": 4 },
                                    scroll: { "xs": 1, "sm": 1, "md": 2, "lg": 3, "xl": 4, "xxl": 4 },
                                    tizerView: "event",
                                    minView: "md"
                                }} />
                            </div>
                        </div>
                    </div>
                </section>
            </React.Fragment>
            : ``
    );
}
