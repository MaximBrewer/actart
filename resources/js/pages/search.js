import React, { useState, useEffect, useRef } from "react";
import { Link, useParams, useLocation } from "react-router-dom";
import __ from '../utils/trans';
import Marquee from '../components/marquee'
import Announce from '../components/announce'
import useDocumentTitle from '../components/document-title';
import MovingGallery from "../components/moving/Gallery";
import WaterfallAjax from "../components/waterfall/WaterfallAjax";

export default function Search(props) {
    useDocumentTitle(__('SEARCH_TITLE'));
    const [state, setState] = useState({
        query: query
    });
    const { query } = useParams();
    const { scrollToElement } = props;

    useEffect(() => {
        setState(prevState => ({
            ...prevState,
            query: query
        }))
    }, [query]);

    return (
        <React.Fragment>
            {state.query ?
                <div className="sticky-wrapper">
                    <section className="authors">
                        <div className="background-text">{__('AUTHORS')}</div>
                        <div className="container">
                            <div className="row announce">
                                <div className="col-60">
                                    <h2 className="h2">{__('AUTHORS')}</h2>
                                </div>
                            </div>
                            <div className="announce-slider-wrapper">
                                <div className="act-waterfall">
                                    <WaterfallAjax
                                        query={state.query}
                                        hide={true}
                                        data={{
                                            entity: "authors",
                                            action: "add",
                                            limit: { "xs": 2, "sm": 2, "md": 2, "lg": 3, "xl": 3, "xxl": 4 },
                                            view: { "xs": 1, "sm": 2, "md": 2, "lg": 3, "xl": 3, "xxl": 4 },
                                            tizerView: "author"
                                        }} />
                                </div>
                            </div>
                        </div>
                    </section>
                    <section className="lots">
                        <div className="background-text">{__('LOTS')}</div>
                        <div className="container">
                            <div className="row announce">
                                <div className="col-60">
                                    <h2 className="h2">{__('LOTS')}</h2>
                                </div>
                            </div>
                            <div className="announce-slider-wrapper">
                                <div className="act-waterfall">
                                    <WaterfallAjax
                                        query={state.query}
                                        hide={true}
                                        data={{
                                            entity: "lots",
                                            action: "add",
                                            limit: { "xs": 2, "sm": 2, "md": 2, "lg": 3, "xl": 3, "xxl": 4 },
                                            view: { "xs": 1, "sm": 2, "md": 2, "lg": 3, "xl": 3, "xxl": 4 },
                                            tizerView: "gallery"
                                        }} />
                                </div>
                            </div>
                        </div>
                    </section>
                    <hr></hr>
                    <section className="events">
                        <div className="background-text">{__('EVENTS')}</div>
                        <div className="container">
                            <div className="row announce">
                                <div className="col-60">
                                    <h2 className="h2">{__('EVENTS')}</h2>
                                </div>
                            </div>
                            <div className="announce-slider-wrapper">
                                <div className="act-waterfall">
                                    <WaterfallAjax
                                        query={state.query}
                                        hide={true}
                                        data={{
                                            entity: "events",
                                            action: "add",
                                            limit: { "xs": 2, "sm": 2, "md": 2, "lg": 3, "xl": 3, "xxl": 4 },
                                            view: { "xs": 1, "sm": 2, "md": 2, "lg": 3, "xl": 3, "xxl": 4 },
                                            tizerView: "event"
                                        }} />
                                </div>
                            </div>
                        </div>
                    </section>
                    <hr></hr>
                    <section className="posts">
                        <div className="background-text">{__('POSTS')}</div>
                        <div className="container">
                            <div className="row announce">
                                <div className="col-60">
                                    <h2 className="h2">{__('POSTS')}</h2>
                                </div>
                            </div>
                            <div className="announce-slider-wrapper">
                                <div className="act-waterfall">
                                    <WaterfallAjax
                                        query={state.query}
                                        hide={true}
                                        data={{
                                            entity: "posts",
                                            action: "add",
                                            limit: { "xs": 2, "sm": 2, "md": 2, "lg": 3, "xl": 3, "xxl": 4 },
                                            view: { "xs": 1, "sm": 2, "md": 2, "lg": 3, "xl": 3, "xxl": 4 },
                                            tizerView: "news"
                                        }} />
                                </div>
                            </div>
                        </div>
                    </section>
                    <div className="sticky-section"><span>{__('SEARCH_STICKY_TEXT')}</span></div>
                </div>
                : ``}
            <div className="mt-5"></div>
            <Marquee />
        </React.Fragment>
    );
}
