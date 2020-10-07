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

export default function Events() {
    const { pathname } = useLocation();
    useDocumentTitle(__('EVENTS_TITLE'));
    return (
        <React.Fragment>
            <Announce />
            <div className="sticky-wrapper">
                <section className="announces" id="exhibitions">
                    <div className="background-text">{__('Exhibitions')}</div>
                    <div className="container">
                        <div className="row announce">
                            <div className="col-xxl-45 col-xl-40">
                                <h2 className="h2">{__('EXHIBITIONS')}</h2>
                                <p className="sub_h2 d-none d-xl-block">
                                    {__('Платформа Акт-Арт представляет три творческих кластера с собственными творческими мастерскими и выставочными галереями. Все кластеры находятся в историческом центре Москвы и далее какой-то текст.')}
                                </p>
                                <p className="sub_h2 d-none d-xl-block">
                                    {__('Все кластеры находятся в историческом центре Москвы и далее какой-то текст. Все кластеры находятся в историческом центре Москвы и далее какой-то текст.')}
                                </p>
                            </div>
                            <div className="col-xxl-15 col-xl-20 d-none d-xl-block">
                                <h3 className="h3">{__('Addresses:')}</h3>
                                <dl>
                                    {window.App.spaces.map((space, index) => {
                                        if (space.type == 'workshop')
                                            return (
                                                <React.Fragment key={index}>
                                                    <dt>{space.title}</dt>
                                                    <dd>{space.address}</dd>
                                                </React.Fragment>
                                            );
                                    })}
                                </dl>
                            </div>
                        </div>
                        <div className="announce-slider-wrapper">
                            <div className="act-waterfall">
                                <WaterfallAjax data={{
                                    entity: "events",
                                    action: "add",
                                    category: "exhibition",
                                    limit: { "xs": 4, "sm": 4, "md": 4, "lg": 6, "xl": 6, "xxl": 8 },
                                    view: { "xs": 1, "sm": 2, "md": 2, "lg": 3, "xl": 3, "xxl": 4 },
                                    scroll: { "xs": 4, "sm": 4, "md": 4, "lg": 6, "xl": 6, "xxl": 8 },
                                    tizerView: "event"
                                }} />
                            </div>
                        </div>
                    </div>
                </section>
                <section className="announces bggray" id="workshops">
                    <div className="background-text">{__('Workshops')}</div>
                    <div className="container">
                        <div className="row announce">
                            <div className="col-xxl-45 col-xl-40">
                                <h2 className="h2">{__('Workshops')}</h2>
                                <p className="sub_h2 d-none d-xl-block">
                                    {__('Платформа Акт-Арт представляет три творческих кластера с собственными творческими мастерскими и выставочными галереями. Все кластеры находятся в историческом центре Москвы и далее какой-то текст.')}
                                </p>
                                <p className="sub_h2 d-none d-xl-block">
                                    {__('Все кластеры находятся в историческом центре Москвы и далее какой-то текст. Все кластеры находятся в историческом центре Москвы и далее какой-то текст.')}
                                </p>
                            </div>
                            <div className="col-xxl-15 col-xl-20 d-none d-xl-block">
                                <h3 className="h3">{__('Addresses:')}</h3>
                                <dl>
                                    {window.App.spaces.map((space, index) => {
                                        console.log(space.type)
                                        if (space.type == 'exhibition')
                                            return (
                                                <React.Fragment key={index}>
                                                    <dt>{space.title}</dt>
                                                    <dd>{space.address}</dd>
                                                </React.Fragment>
                                            );
                                    })}
                                </dl>
                            </div>
                        </div>
                        <div className="announce-slider-wrapper">
                            <div className="act-waterfall">
                                <WaterfallAjax data={{
                                    entity: "events",
                                    action: "add",
                                    category: "workshop",
                                    limit: { "xs": 4, "sm": 4, "md": 4, "lg": 6, "xl": 6, "xxl": 8 },
                                    view: { "xs": 1, "sm": 2, "md": 2, "lg": 3, "xl": 3, "xxl": 4 },
                                    scroll: { "xs": 4, "sm": 4, "md": 4, "lg": 6, "xl": 6, "xxl": 8 },
                                    tizerView: "event"
                                }} />
                            </div>
                        </div>
                    </div>
                </section>
                <div className="sticky-section"><span>{__('event announcements')}</span></div>
            </div>
            <section id="gallery">
                <MovingGallery />
            </section>
            <section className="blog-section">
                <div className="background-text">{__('BLOG')}</div>
                <div className="sticky-wrapper">
                    <div className="container">
                        <div className="waterfall-wrapper">
                            <div className="act-waterfall">
                                <WaterfallAjax data={{
                                    entity: "post",
                                    action: "none",
                                    category: "blog",
                                    limit: { "xs": 4, "sm": 4, "md": 4, "lg": 3, "xl": 3, "xxl": 4 },
                                    view: { "xs": 1, "sm": 2, "md": 2, "lg": 3, "xl": 3, "xxl": 4 },
                                    scroll: { "xs": 4, "sm": 4, "md": 4, "lg": 3, "xl": 3, "xxl": 4 },
                                    tizerView: "blog"
                                }} />
                            </div>
                        </div>
                    </div>
                    <div className="sticky-section"><span>{__('act•art blog')}</span></div>
                </div>
            </section>
            <Marquee />
        </React.Fragment>
    );
}
