import React, { useState, useEffect, useRef } from "react";
import Slider from "react-slick";
import Left from "./Left";
import Right from "./Right";
import { ArrowPrew, ArrowNext } from "../../../icons/icons";
import __ from "../../../utils/trans";
import { useHistory, useParams } from "react-router-dom";

export default function Carousel(props) {
    const { id } = useParams();
    let history = useHistory();

    const updateLotStatus = event => {
        if (
            id == event.detail.id &&
            event.detail.status != "gallery"
        )
            history.push("/gallery");
    };

    useEffect(() => {
        window.addEventListener("update-lot-status", updateLotStatus);
        return () => {
            window.removeEventListener("update-lot-status", updateLotStatus);
        };
    }, []);

    useEffect(() => {
        window.removeEventListener("update-lot-status", updateLotStatus);
        window.addEventListener("update-lot-status", updateLotStatus);
        let index = getIndex();
        if (props.items[index])
            document.title = __("LOT_IN_GALLERY_PAGE_TITLE", {
                lot_name: props.items[index].title,
                author_name: props.items[index].author
            });
        refPicture.current.slickGoTo(index);
        refAnnounce.current.slickGoTo(index);
    }, [id]);

    const refPicture = useRef();
    const refAnnounce = useRef();

    const getIndex = () => {
        for (let i in props.items) {
            if (props.items[i].id == id) return i;
        }
    };

    const prevId = () => {
        let index = 0;
        for (let i in props.items) {
            if (props.items[i].id == id) index = i * 1 - 1;
        }
        index = index < 0 ? props.items.length - 1 : index;
        return props.items[index].id;
    };

    const nextId = () => {
        let index = 0;
        for (let i in props.items) {
            if (props.items[i].id == id) index = i * 1 + 1;
        }
        index = props.items.length == index ? 0 : index;
        return props.items[index].id;
    };

    const setting = {
        arrows: false,
        infinite: false,
        draggable: false,
        dots: false,
        speed: 300,
        auto: true,
        slidesToShow: 1,
        slidesToScroll: 1
    };

    const settingsPicture = {
        ...setting
    };
    const settingsAnnounce = {
        ...setting
    };

    return (
        <div className="lot-carousel">
            <div className="carousel-arrows-wrapper">
                <div className="carousel-arrows">
                    <a
                        className="btn btn-default btn-control d-flex"
                        onClick={() => {
                            history.replace("/gallery/lot/" + prevId());
                        }}
                    >
                        <ArrowPrew />
                    </a>
                    <a
                        className="btn btn-default btn-control d-flex"
                        onClick={() => {
                            history.replace("/gallery/lot/" + nextId());
                        }}
                    >
                        <ArrowNext />
                    </a>
                </div>
            </div>
            <div className="row">
                <div className="col-xl-40 col-xxl-38">
                    <div className="left-side">
                        <Slider {...settingsPicture} ref={refPicture}>
                            {props.items.map((item, index) => (
                                <div key={index}>
                                    <Left item={item} {...props} />
                                </div>
                            ))}
                        </Slider>
                    </div>
                </div>
                <div className="col-xl-20 col-xxl-22">
                    <div className="right-side">
                        <Slider {...settingsAnnounce} ref={refAnnounce}>
                            {props.items.map((item, index) => (
                                <div key={index}>
                                    <Right item={item} {...props} />
                                </div>
                            ))}
                        </Slider>
                    </div>
                </div>
            </div>
        </div>
    );
}
