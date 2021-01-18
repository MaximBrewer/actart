import React, { useEffect } from "react";
import Waterfall from "../waterfall/Waterfall";
import { Link, useParams, useHistory } from "react-router-dom";
import Carousel from "./carousel/Carousel";
import __ from "../../utils/trans";

export default function Lot(props) {

    return (
        <section className="lot-section">
            <div className="sticky-wrapper">
                <div className="container">
                    <Carousel {...props} items={props.items} />
                    <div className="gallery-works" id="galleryWorksList">
                        <div className="h2">{__("Works for sale")}</div>
                        <div className="gallery-works-list">
                            <Waterfall
                                {...props}
                                data={{
                                    sortable: true,
                                    gallery: true,
                                    tizerView: "gallery",
                                    view: {
                                        xs: 1,
                                        sm: 2,
                                        md: 2,
                                        lg: 3,
                                        xl: 4,
                                        xxl: 4
                                    }
                                }}
                            />
                            <div className="text-center my-2">
                                <Link to="/gallery" className="btn btn-default">
                                    {__("BTN_BACK_TO_GALLERY")}
                                </Link>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="sticky-section">
                    <span>{__("works for sale")}</span>
                </div>
            </div>
        </section>
    );
}
