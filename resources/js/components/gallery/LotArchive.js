import React, { useEffect } from "react";
import WaterfallAjax from "../waterfall/WaterfallAjax";
import { Link, useParams } from "react-router-dom";
import Carousel from "./carousel/Carousel";
import __ from "../../utils/trans";
import LotCard from "./lotcard/LotCard";

export default function Lot(props) {
    return (
        <section className="lot-section">
            <div className="sticky-wrapper">
                <div className="container">
                    <LotCard {...props} />
                    <div className="gallery-works" id="galleryWorksList">
                        <div className="row announce mb-5">
                            <div className="col-60">
                                <h2 className="h1">
                                    {__("GALLERY_ARCHIVE_H2")}
                                </h2>
                            </div>
                        </div>
                        <div className="gallery-works" id="galleryWorksList">
                            <div className="gallery-works-list">
                                <WaterfallAjax
                                    data={{
                                        entity: "lots",
                                        action: "add",
                                        sortable: true,
                                        archive: true,
                                        gallery: true,
                                        tizerView: "gallery",
                                        limit: {
                                            xs: 12,
                                            sm: 12,
                                            md: 12,
                                            lg: 12,
                                            xl: 12,
                                            xxl: 12
                                        },
                                        view: {
                                            xs: 2,
                                            sm: 2,
                                            md: 2,
                                            lg: 2,
                                            xl: 3,
                                            xxl: 3
                                        }
                                    }}
                                />
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
