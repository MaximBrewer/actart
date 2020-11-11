import React, { useState, useEffect, useRef } from "react";
import Slider from "react-slick";
import Left from "./Left";
import Right from "./Right";
import { ArrowPrew, ArrowNext } from "../../../icons/icons";
import __ from "../../../utils/trans";
import { useHistory } from "react-router-dom";

export default function Carousel(props) {
    let history = useHistory();

    const [state, setState] = useState({
        items: props.items,
        id: props.id
    });

    useEffect(() => {
        window.addEventListener("remove-lot", removeLot);
        return () => window.removeEventListener("remove-lot", removeLot);
    }, []);

    const removeLot = event => {
        history.push("/gallery");
    };

    useEffect(() => {
        console.log(state.id)
        let index = getIndex();
        document.title = __("LOT_IN_GALLERY_PAGE_TITLE", {
            lot_name: state.items[index].title,
            author_name: state.items[index].author
        });
        refPicture.current.slickGoTo(index, true);
        refAnnounce.current.slickGoTo(index, true);
        // history.replace("/gallery/lot/" + state.id);
    }, [state.id]);

    const refPicture = useRef();
    const refAnnounce = useRef();

    const getIndex = () => {
        for (let i in state.items) {
            if (state.items[i].id == state.id) return i;
        }
    };

    const setting = {
        arrows: false,
        infinite: true,
        dots: false,
        speed: 300,
        auto: true,
        slidesToShow: 1,
        slidesToScroll: 1
    };

    const settingsPicture = {
        ...setting,
        afterChange: current =>
            history.replace("/gallery/lot/" + state.items[current].id),
        beforeChange: (current, next) => {
            let cnt = refPicture.current.props.children.length;
            if (
                (next > current && (next == 1 || current != 0)) ||
                (current == cnt - 1 && next == 0)
            )
                refAnnounce.current.slickNext(false);
            else refAnnounce.current.slickPrev(false);
        }
    };
    const settingsAnnounce = {
        ...setting,
        beforeChange: (current, next) => {
            let cnt = refPicture.current.props.children.length;
            if (
                (next > current && (next == 1 || current != 0)) ||
                (current == cnt - 1 && next == 0)
            )
                refPicture.current.slickNext(false);
            else refPicture.current.slickPrev(false);
        }
    };

    return (
        <div className="lot-carousel">
            <div className="carousel-arrows-wrapper">
                <div className="carousel-arrows">
                    <a
                        className="btn btn-default btn-control d-flex"
                        onClick={() => {
                            refAnnounce.current.slickPrev();
                        }}
                    >
                        <ArrowPrew />
                    </a>
                    <a
                        className="btn btn-default btn-control d-flex"
                        onClick={() => {
                            refAnnounce.current.slickNext();
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
