import React, { useState } from "react";
import { useLocation } from "react-router-dom";
import __ from '../utils/trans';
import Marquee from '../components/marquee'
import Announce from '../components/announce'
import useDocumentTitle from '../components/document-title';
import MovingGallery from "../components/moving/Gallery";
import WaterfallAjax from "../components/waterfall/WaterfallAjax";

export default function News() {
    useDocumentTitle(__('BLOG_TITLE'));
    return (
        <React.Fragment>
            <Announce />
            <section className="news-section">
                <div className="background-text">{__('NEWS')}</div>
                <div className="sticky-wrapper">
                    <div className="container">
                        <div className="waterfall-wrapper">
                            <div className="act-waterfall">
                                <WaterfallAjax data={{
                                    entity: "post",
                                    action: "add",
                                    category: "news",
                                    limit: { "xs": 4, "sm": 4, "md": 4, "lg": 3, "xl": 3, "xxl": 4 },
                                    view: { "xs": 1, "sm": 2, "md": 2, "lg": 3, "xl": 3, "xxl": 4 },
                                    scroll: { "xs": 4, "sm": 4, "md": 4, "lg": 3, "xl": 3, "xxl": 4 },
                                    tizerView: "news"
                                }} />
                            </div>
                        </div>
                    </div>
                    <div className="sticky-section"><span>{__('act•art news')}</span></div>
                </div>
            </section>
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
