import React from "react";
import { useLocation } from "react-router-dom";
import __ from "../utils/trans";
import Marquee from "../components/marquee";
import Announce from "../components/announce";
import useDocumentTitle from "../components/document-title";
import WaterfallAjax from "../components/waterfall/WaterfallAjax";

export default function Blog(props) {
    useDocumentTitle(__("BLOG_PAGE_TITLE"));

    return (
        <React.Fragment>
            <Announce {...props} />
            <section className="blog-section">
                <div className="background-text">{__("BLOG")}</div>
                <div className="sticky-wrapper">
                    <div className="container">
                        <div className="waterfall-wrapper">
                            <div className="act-waterfall">
                                <WaterfallAjax
                                    data={{
                                        entity: "post",
                                        action: "add",
                                        category: "blog",
                                        limit: {
                                            xs: 4,
                                            sm: 4,
                                            md: 4,
                                            lg: 6,
                                            xl: 6,
                                            xxl: 6
                                        },
                                        view: {
                                            xs: 1,
                                            sm: 2,
                                            md: 2,
                                            lg: 3,
                                            xl: 3,
                                            xxl: 3
                                        },
                                        scroll: {
                                            xs: 4,
                                            sm: 4,
                                            md: 4,
                                            lg: 3,
                                            xl: 3,
                                            xxl: 3
                                        },
                                        tizerView: "news"
                                    }}
                                />
                            </div>
                        </div>
                    </div>
                    <div className="sticky-section"> <span>{__("act•art blog")}</span> </div>
                </div>
            </section>
            <Marquee />
        </React.Fragment>
    );
}
