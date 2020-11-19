import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import __ from '../utils/trans';
import YandexShare from 'react-yandex-share';
import useDocumentTitle from '../components/document-title';
import Parser from "../utils/parser";
import MovingGallery from "../components/moving/Gallery";
import Carousel from "../components/carousel/Carousel";
import App from "../router";

export default function Eventtem(props) {
    const { req } = props;
    const [state, setState] = useState({ event: null });
    const { id } = useParams();

    useDocumentTitle(__('EVENTS_TITLE'));

    useEffect(() => {
        req('/api/' + window.App.locale + '/event/' + id)
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
                                <div className="col-60 tag-p-40">
                                    <Parser body={state.event.body} {...props} />
                                </div>
                            </div>
                            <hr />
                            <div className="sharing">
                                <p>{__('Liked? Share with your friends!')}</p>
                                <YandexShare />
                            </div>
                        </div>
                    </section>
                    <div className="sticky-section"><span>{__('event announcements')}</span></div>
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
            :
            <div className="sticky-wrapper">
                <section id="page">
                    <div className="container">
                        <div className="loading-page">
                            <div className="row">
                                <div className={`col-xl-60`}>
                                    <h2 className="h2 title-loading">
                                        <div className="block-loading">
                                            <div className="block-loading-animation">
                                                <span></span>
                                            </div>
                                        </div>
                                    </h2>
                                    <hr />
                                    <div className="sub_h2 subtitle-loading">
                                        <div className="block-loading">
                                            <div className="block-loading-animation">
                                                <span></span>
                                                <span></span>
                                                <span></span>
                                                <span></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="row">
                                <div className="col-60">
                                    <div className="block-loading">
                                        <div className="block-loading-animation">
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr />
                            <div className="sharing sticky-loading">
                                <br />
                            </div>
                        </div>
                    </div>
                </section>
                <div className="sticky-section"><span className="sticky-loading"></span></div>
            </div>
    );
}
