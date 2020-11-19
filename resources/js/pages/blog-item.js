import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import __ from "../utils/trans";
import YandexShare from "react-yandex-share";
import useDocumentTitle from "../components/document-title";
import Parser from "../utils/parser";
import MovingGallery from "../components/moving/Gallery";
import WaterfallAjax from "../components/waterfall/WaterfallAjax";

export default function BlogItem(props) {
    useDocumentTitle(__("BLOG_PAGE_TITLE"));

    const { req } = props;
    const [state, setState] = useState({ post: null });
    const { slug } = useParams();

    useEffect(() => {
        req("/api/" + window.App.locale + "/post/" + slug)
            .then(({ post }) =>
                setState(prevState => {
                    document.title = post.title;
                    return {
                        ...prevState,
                        post
                    };
                })
            )
            .catch(() => null);
    }, [slug]);

    return state.post ? (
        <React.Fragment>
            <div className="sticky-wrapper">
                <section id="page">
                    <div className="container">
                        <div className="row pb-2 pb-lg-5">
                            <div className="col-xl-30 col-xxl-28">
                                <h2 className="h2">{state.post.title}</h2>
                                <hr />
                                <p className="sub_h2 d-none d-xl-block">
                                    {Parser(state.post.excerpt)}
                                </p>
                            </div>
                            <div className="col-xl-30 col-xxl-32 d-none d-xl-block">
                                <div
                                    className="image-wrapper"
                                    style={{
                                        backgroundImage:
                                            `url(` + state.post.image + `)`
                                    }}
                                ></div>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-60 tag-p-40">
                                <Parser body={state.post.body} {...props} />
                            </div>
                        </div>
                        <hr />
                        <div className="sharing">
                            <p>{__("Liked? Share with your friends!")}</p>
                            <YandexShare />
                        </div>
                    </div>
                </section>
                <div className="sticky-section"><span>{__("act•art blog")}</span> </div>
            </div>
            <section className="blog-section">
                <div className="container">
                    <div className="waterfall-wrapper">
                        <div className="act-waterfall">
                            <WaterfallAjax
                                data={{
                                    entity: "post",
                                    action: "none",
                                    category: "blog",
                                    limit: {
                                        xs: 4,
                                        sm: 4,
                                        md: 4,
                                        lg: 3,
                                        xl: 3,
                                        xxl: 4
                                    },
                                    view: {
                                        xs: 1,
                                        sm: 2,
                                        md: 2,
                                        lg: 3,
                                        xl: 3,
                                        xxl: 4
                                    },
                                    scroll: {
                                        xs: 4,
                                        sm: 4,
                                        md: 4,
                                        lg: 3,
                                        xl: 3,
                                        xxl: 4
                                    },
                                    tizerView: "blog"
                                }}
                            />
                        </div>
                    </div>
                </div>
            </section>
            <section id="gallery"><MovingGallery /></section>
        </React.Fragment>
    ) : (
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
                <div className="sticky-section">
                    <span className="sticky-loading"></span>
                </div>
            </div>
        );
}
