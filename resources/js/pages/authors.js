import React from "react";
import __ from "../utils/trans";
import Marquee from "../components/marquee";
import Announce from "../components/announce";
import useDocumentTitle from "../components/document-title";
import MovingGallery from "../components/moving/Gallery";
import Waterfall from "../components/waterfall/Waterfall";

export default function Authors(props) {
    useDocumentTitle(__("AUTHORS_PAGE_TITLE"));
    return (
        <React.Fragment>
            <Announce {...props} />
            <div className="sticky-wrapper">
                <section className="authors">
                    <div className="background-text">{__("#AUTHORS_BACKGROUND_TEXT#")}</div>
                    <div className="container">
                        <div className="row announce">
                            <div className="col-xxl-45 col-xl-40">
                                <h2 className="h2">{__("#AUTHORS_PAGE_TITLE#")}</h2>
                            </div>
                        </div>
                        <div className="announce-slider-wrapper">
                            <div className="act-waterfall">
                                <Waterfall
                                    items={window.App.authors}
                                    {...props}
                                    data={{
                                        sorting: ["surname"],
                                        searching: ["name", "surname"],
                                        entity: "authors",
                                        action: "add",
                                        limit: {
                                            xs: 24,
                                            sm: 24,
                                            md: 24,
                                            lg: 24,
                                            xl: 24,
                                            xxl: 24
                                        },
                                        view: {
                                            xs: 1,
                                            sm: 2,
                                            md: 2,
                                            lg: 3,
                                            xl: 3,
                                            xxl: 4
                                        },
                                        tizerView: "author"
                                    }}
                                />
                            </div>
                        </div>
                    </div>
                </section>
                <div className="sticky-section">
                    <span>{__("#AUTHORS_STICKY_TEXT#")}</span>
                </div>
            </div>
            <section id="gallery">
                <MovingGallery {...props} />
            </section>
            <Marquee />
        </React.Fragment>
    );
}
