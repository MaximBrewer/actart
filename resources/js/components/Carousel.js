import React, { useState, useEffect, useRef } from "react";
import Slider from "react-slick";

export default function Carousel(props) {
    const { req } = props;

    const [state, setState] = useState({
        slides: [],
        prefix: "",
        slideIndex: 0,
        slidesTotal: 0,
        height: 0
    });

    const refPicture = useRef();

    const grid = window.grid;

    const gridCount = {
        xs: 1,
        sm: 1,
        md: 1,
        lg: 1,
        xl: 1,
        xxl: 1
    };

    useEffect(() => {
        addSlides();
    }, []);

    const slidesToShow = () => {
        let size = "xs";
        for (size in grid) if (window.innerWidth < grid[size]) break;
        return gridCount[size];
    };
    const setting = {
        arrows: false,
        dots: false,
        speed: 300,
        centerMode: true,
        auto: true,
        variableWidth: true,
        slidesToScroll: 1,
        beforeChange: (current, next) => {
            setState(prevState => {
                return {
                    ...prevState,
                    slideIndex: next
                };
            });
        }
    };

    const addSlides = () => {
        req(
            "/api/" +
                window.App.locale +
                "/get_carousel_items/" +
                props.entity +
                "/" +
                props.id
        )
            .then(({ slides, prefix }) => {
                setState(prevState => {
                    let maxWidth = 0;
                    for (let i in slides)
                        maxWidth =
                            maxWidth > slides[i].w / slides[i].h
                                ? maxWidth
                                : slides[i].w / slides[i].h;
                    let height = (window.innerWidth - 40) / maxWidth;
                    return {
                        ...prevState,
                        slides: slides,
                        prefix: prefix,
                        height: height < 400 ? height : 400
                    };
                });
            })
            .catch(() => null);
    };

    return (
        <div className="carousel-wrapper pb-5">
            <div className="cg">
                <Slider {...setting} ref={refPicture}>
                    {state.slides.map((item, index) => {
                        let height;
                        return (
                            <div
                                className="px-2"
                                key={index}
                            >
                                <img
                                    src={item.path}
                                    alt=""
                                    style={{
                                        display: "block",
                                        width: (item.w * state.height) / item.h
                                    }}
                                />
                            </div>
                        );
                    })}
                </Slider>
            </div>
            <div className="d-flex justify-content-between py-5">
                <div className="carousel-lines">
                    {state.slides.map((item, index) => (
                        <div
                            onClick={() => {
                                refPicture.current.slickGoTo(index);
                            }}
                            className={`line${
                                index == state.slideIndex ? ` active` : ``
                            }`}
                            style={{ display: index > 10 ? `none` : `` }}
                            key={index}
                        ></div>
                    ))}
                </div>
                <div className="carousel-arrows">
                    <a
                        className="btn btn-default btn-control d-flex"
                        onClick={() => {
                            refPicture.current.slickPrev();
                        }}
                    >
                        <svg
                            width="39"
                            height="36"
                            viewBox="0 0 39 36"
                            fill="none"
                            xmlns="http://www.w3.org/2000/svg"
                        >
                            <path
                                d="M20.5946 3L6 18L20.5946 33"
                                stroke="#1B292B"
                                strokeWidth="8"
                            />
                            <path
                                d="M7.62164 17.5946H38.4325"
                                stroke="#1E2B32"
                                strokeWidth="8"
                            />
                        </svg>
                    </a>
                    <a
                        className="btn btn-default btn-control d-flex"
                        onClick={() => {
                            refPicture.current.slickNext();
                        }}
                    >
                        <svg
                            width="39"
                            height="36"
                            viewBox="0 0 39 36"
                            fill="none"
                            xmlns="http://www.w3.org/2000/svg"
                        >
                            <path
                                d="M18.4054 33L33 18L18.4054 3"
                                stroke="#1B292B"
                                strokeWidth="8"
                            />
                            <path
                                d="M31.3784 18.4054L0.567543 18.4054"
                                stroke="#1E2B32"
                                strokeWidth="8"
                            />
                        </svg>
                    </a>
                </div>
            </div>
        </div>
    );
}
