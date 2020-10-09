import React, { useState, useEffect, useRef } from "react";
import Slider from "react-slick";
import EventTizer from "./event/Tizer.js";
import EventHeader from "./event/Header.js";
import EventFooter from "./event/Footer.js";
import PostTizer from "./posts/Tizer.js";
import PostHeader from "./posts/Header.js";
import PostFooter from "./posts/Footer.js";
import ExpertTizer from "./expert/Tizer.js";
import ExpertHeader from "./expert/Header.js";
import ExpertFooter from "./expert/Footer.js";
import __ from '../../utils/trans';

export default function Carousel(props) {
    const { data } = props;
    const [state, setState] = useState({
        slideIndex: 0,
        slidesTotal: 0,
        items: []
    });
    const refPicture = useRef();

    const Tizer = props => {
        switch (data.tizerView) {
            case "event":
                return <EventTizer {...props} />;
            case "post":
                return <PostTizer {...props} />;
            case "expert":
                return <ExpertTizer {...props} />;
            default:
                return <EventTizer {...props} />;
        }
    };

    const Header = props => {
        switch (data.tizerView) {
            case "event":
                return <EventHeader {...props} />;
            case "post":
                return <PostHeader {...props} />;
            case "expert":
                return <ExpertHeader {...props} />;
            default:
                return <EventHeader {...props} />;
        }
    };

    const Footer = props => {
        switch (data.tizerView) {
            case "event":
                return <EventFooter {...props} />;
            case "post":
                return <PostFooter {...props} />;
            case "expert":
                return <ExpertFooter {...props} />;
            default:
                return <EventFooter {...props} />;
        }
    };

    const grid = window.grid;

    const slidesToShow = () => {
        let size = "xs";
        for (size in grid) if (window.innerWidth < grid[size]) break;
        return data.view[size];
    };

    const slidesToScroll = () => {
        let size = "xs";
        for (size in grid) if (window.innerWidth < grid[size]) break;
        return data.scroll[size];
    };

    const getLimit = () => {
        let size = "xs";
        for (size in window.grid)
            if (window.innerWidth < window.grid[size]) break;
        return data.limit[size];
    };

    const setting = {
        arrows: false,
        infinite: true,
        dots: false,
        speed: 300,
        auto: true,
        slidesToShow: slidesToShow(),
        slidesToScroll: slidesToScroll(),
        beforeChange: (current, next) => {
            setState(prevState => {
                return {
                    ...prevState,
                    slideIndex: next
                };
            });
        }
    };

    const init = () => {
        if (!!props.items && props.items.length) { 
            setState(prevState => {
                return {
                    ...prevState,
                    slideIndex: 0,
                    slidesTotal: props.items.length,
                    items: props.items
                };
            });
        } else {
            axios
                .get(
                    "/api/" +
                    window.App.locale +
                    "/" +
                    data.entity +
                    "?&offset=0" +
                    "&limit=" +
                    getLimit()
                )
                .then(res => {
                    setState(prevState => {
                        return {
                            ...prevState,
                            slideIndex: 0,
                            slidesTotal: res.data.items.length,
                            items: res.data.items
                        };
                    });
                })
                .catch(err => {
                    console.log(err);
                });
        }
    };

    useEffect(() => {
        init();
    }, []);

    if (window.innerWidth < grid[data.minView]) {
        return (
            <React.Fragment>
                <Header {...props} refPicture={refPicture} />
                <div className="d-md-flex justify-content-between flex-wrap">
                    {state.items.map((item, index) => (
                        <Tizer item={item} key={index} {...props} />
                    ))}
                </div>
                <Footer {...props} refPicture={refPicture} state={state} />
            </React.Fragment>
        );
    } else {
        return (
            <React.Fragment>
                <Header {...props} refPicture={refPicture} />
                <Slider {...setting} ref={refPicture}>
                    {state.items.map((item, index) => (
                        <Tizer item={item} key={index} {...props} />
                    ))}
                </Slider>
                <Footer {...props} refPicture={refPicture} state={state} />
            </React.Fragment>
        );
    }
}
