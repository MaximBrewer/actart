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

export default function Blog() {
    useDocumentTitle(__('BLOG_PAGE_TITLE'));
    const [state, setState] = useState({ page: null });

    const { pathname } = useLocation();

    return (
        <React.Fragment>
            <Announce />
            <section className="blog-section">
                <div className="background-text">{__('BLOG')}</div>
                <div className="sticky-wrapper">
                    <div className="container">
                        <div className="waterfall-wrapper">
                            <div className="act-waterfall">
                                <WaterfallAjax data={{
                                    entity: "post",
                                    action: "add",
                                    category: "blog",
                                    limit: { "xs": 4, "sm": 4, "md": 4, "lg": 3, "xl": 3, "xxl": 4 },
                                    view: { "xs": 1, "sm": 2, "md": 2, "lg": 3, "xl": 3, "xxl": 4 },
                                    scroll: { "xs": 4, "sm": 4, "md": 4, "lg": 3, "xl": 3, "xxl": 4 },
                                    tizerView: "news"
                                }} /></div>
                        </div>
                    </div>
                    <div className="sticky-section"><span>{__('act•art blog')}</span></div>
                </div>
            </section>
            <Marquee />
        </React.Fragment>
    );
}
