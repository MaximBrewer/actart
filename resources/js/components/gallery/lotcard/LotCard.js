import React, { useState, useEffect, useRef } from "react";
import Slider from "react-slick";
import Left from "./Left";
import Right from "./Right";
import { ArrowPrew, ArrowNext } from "../../../icons/icons";
import __ from "../../..//utils/trans";
import { useHistory, useParams } from "react-router-dom";

export default function LotCard(props) {
    const { req } = props;
    const { id } = useParams();
    let history = useHistory();

    const [item, setItem] = useState(null);

    useEffect(() => {
        req("/api/" + window.App.locale + "/lot/" + id)
            .then(({ lot }) => {
                if (lot.status != "gsold") history.goBack();
                else {
                    setItem(null);
                    setItem(lot);
                }
            })
            .catch(() => null);
    }, [id]);

    return (
        <div className="lot-carousel">
            {item && (
                <>
                    <div className="carousel-arrows-wrapper">
                        <div
                            className={`carousel-arrows ${!item.prevId &&
                                ` justify-content-end`}`}
                        >
                            {item.prevId ? (
                                <a
                                    className="btn btn-default btn-control d-flex"
                                    onClick={() => {
                                        window.skipScroll = true;
                                        history.push(
                                            "/gallery/archive/lot/" +
                                                item.prevId
                                        );
                                    }}
                                >
                                    <ArrowPrew />
                                </a>
                            ) : (
                                ``
                            )}
                            {item.nextId ? (
                                <a
                                    className="btn btn-default btn-control d-flex"
                                    onClick={() => {
                                        window.skipScroll = true;
                                        history.push(
                                            "/gallery/archive/lot/" +
                                                item.nextId
                                        );
                                    }}
                                >
                                    <ArrowNext />
                                </a>
                            ) : (
                                ``
                            )}
                        </div>
                    </div>
                    <div className="row">
                        <div className="col-xl-40 col-xxl-38">
                            <div className="left-side">
                                <Left item={item} {...props} />
                            </div>
                        </div>
                        <div className="col-xl-20 col-xxl-22">
                            <div className="right-side">
                                <Right item={item} {...props} />
                            </div>
                        </div>
                    </div>
                </>
            )}
        </div>
    );
}
