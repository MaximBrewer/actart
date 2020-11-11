import React, { useState, useEffect, useRef } from "react";
import Slider from "react-slick";
import Left from "./Left";
import Right from "./Right";
import { ArrowPrew, ArrowNext } from "../../../icons/icons";
import __ from "../../../utils/trans";
import { useHistory, useParams } from "react-router-dom";

export default function Carousel(props) {
    const { id, lotId } = useParams();
    let history = useHistory();

    const [state, setState] = useState({
        items: props.auction.lots
    });

    const getIndex = () => {
        for (let i in state.items) if (state.items[i].id == lotId) return i;
        return 0;
    };

    useEffect(() => {
        console.log(lotId)
        let index = getIndex();
        document.title = __("LOT_IN_AUCTION_PAGE_TITLE", {
            lot_name: state.items[index].title,
            author_name: state.items[index].author
        });
        refPicture.current.slickGoTo(index);
        refAnnounce.current.slickGoTo(index);
    }, [lotId]);

    const refPicture = useRef();
    const refAnnounce = useRef();

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

    const prevId = () => {
        let index = 0;
        for (let i in state.items) {
            if (state.items[i].id == lotId) index = i * 1 - 1;
        }
        index = index < 0 ? state.items.length - 1 : index;
        return state.items[index].id;
    };

    const nextId = () => {
        let index = 0;
        for (let i in state.items) {
            if (state.items[i].id == lotId) index = i * 1 + 1;
        }
        index = state.items.length == index ? 0 : index;
        return state.items[index].id;
    };

    return (
        <div className="lot-carousel">
            <div className="carousel-arrows-wrapper">
                <div className="carousel-arrows">
                    <a
                        className="btn btn-default btn-control d-flex"
                        onClick={() => {
                            history.replace(
                                "/auctions/" + id + "/lot/" + prevId()
                            );
                        }}
                    >
                        <ArrowPrew />
                    </a>
                    <a
                        className="btn btn-default btn-control d-flex"
                        onClick={() => {
                            history.replace(
                                "/auctions/" + id + "/lot/" + nextId()
                            );
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
                            {state.items.map((item, index) => (
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
                            {state.items.map((item, index) => (
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
