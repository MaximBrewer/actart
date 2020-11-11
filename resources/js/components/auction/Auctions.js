import React, { useState, useEffect, useRef } from "react";
import Slider from "react-slick";
import AuctionPreviewLeftComing from "./coming/blocks/AuctionPreviewLeft";
import AuctionPreviewRightComing from "./coming/blocks/AuctionPreviewRight";
import AuctionPreviewLeftOnline from "./online/blocks/AuctionPreviewLeft";
import AuctionPreviewRightOnline from "./online/blocks/AuctionPreviewRight";
import __ from "../../utils/trans";
import { Link } from "react-router-dom";

export default function Auctions(props) {
    const [state, setState] = useState({
        slideIndex: 0,
        slidesTotal: App.coming.length,
        auctions: App.coming
    });

    const updateAuctionStatus = event => {
        setState(prevState => {
            let update = false;
            let auctions = { ...prevState.auctions };
            for (let i in auctions) {
                if (event.detail.id == auctions[i].id) {
                    auctions[i].status = event.detail.status;
                    update = true;
                }
            }
            return update
                ? {
                      ...prevState,
                      auctions
                  }
                : prevState;
        });
    };

    useEffect(() => {
        window.addEventListener("update-auction-status", updateAuctionStatus);
        return () => {
            window.removeEventListener(
                "update-auction-status",
                updateAuctionStatus
            );
        };
    }, []);

    const refPicture = useRef();
    const refAnnounce = useRef();

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
        beforeChange: (current, next) => {
            setState(prevState => {
                return {
                    slideIndex: next,
                    ...prevState
                };
            });
            if (
                (next > current && (next == 1 || current != 0)) ||
                (current == App.coming.length - 1 && next == 0)
            )
                refAnnounce.current.slickNext(false);
            else refAnnounce.current.slickPrev(false);
        }
    };
    const settingsAnnounce = {
        ...setting,
        beforeChange: (current, next) => {
            setState(prevState => {
                return {
                    slideIndex: next,
                    ...prevState
                };
            });
            if (
                (next > current && (next == 1 || current != 0)) ||
                (current == App.coming.length - 1 && next == 0)
            )
                refPicture.current.slickNext(false);
            else refPicture.current.slickPrev(false);
        }
    };

    {
        state.auctions.map((item, index) => {
            const AuctionPreviewLeft = props => {
                switch (item.status) {
                    case "coming":
                        return <AuctionPreviewLeftComing {...props} />;
                    case "online":
                        return <AuctionPreviewLeftOnline {...props} />;
                }
            };
            const AuctionPreviewRight = props => {
                switch (item.status) {
                    case "coming":
                        return <AuctionPreviewRightComing {...props} />;
                    case "online":
                        return <AuctionPreviewRightOnline {...props} />;
                }
            };
            return (
                <div className="row auction-preview py-4" key={index}>
                    <div className="col-xl-40 col-xxl-38">
                        <div className="left-auction-side">
                            <hr className="d-xl-none" />
                            <AuctionPreviewLeft auction={item} {...props} />
                        </div>
                    </div>
                    <div className="col-xl-20 col-xxl-22">
                        <div className="right-auction-side">
                            <AuctionPreviewRight auction={item} {...props} />
                            <hr className="d-xl-none" />
                        </div>
                    </div>
                </div>
            );
        });
    }
    return (
        <React.Fragment>
            <div className="row">
                <div className="col-xl-40 col-xxl-38">
                    <div className="left-auction-side">
                        <hr className="d-xl-none" />
                        <Slider {...settingsPicture} ref={refPicture}>
                            {state.auctions.map((item, index) => (
                                <div key={index}>
                                    {item.status == "coming" ? (
                                        <AuctionPreviewLeftComing
                                            auction={item}
                                            {...props}
                                        />
                                    ) : (
                                        ``
                                    )}
                                    {item.status == "started" ? (
                                        <AuctionPreviewLeftOnline
                                            auction={item}
                                            {...props}
                                        />
                                    ) : (
                                        ``
                                    )}
                                </div>
                            ))}
                        </Slider>
                    </div>
                </div>
                <div className="col-xl-20 col-xxl-22">
                    <div className="right-auction-side">
                        <Slider {...settingsAnnounce} ref={refAnnounce}>
                            {state.auctions.map((item, index) => (
                                <div key={index}>
                                    {item.status == "coming" ? (
                                        <AuctionPreviewRightComing
                                            auction={item}
                                            {...props}
                                        />
                                    ) : (
                                        ``
                                    )}
                                    {item.status == "started" ? (
                                        <AuctionPreviewRightOnline
                                            auction={item}
                                            {...props}
                                        />
                                    ) : (
                                        ``
                                    )}
                                </div>
                            ))}
                        </Slider>
                        <hr className="d-xl-none" />
                    </div>
                </div>
            </div>
            <div className="row carousel-controls py-3">
                <div className="col-30 col-md-15 col-xl-40 col-xxl-38">
                    <div className="carousel-button d-none d-xl-block">
                        <Link to="/auctions" className="btn btn-default">
                            {__("All auctions")}
                        </Link>
                    </div>
                    <div className="carousel-arrows">
                        <a
                            className="btn btn-default btn-control d-flex"
                            onClick={() => {
                                refAnnounce.current.slickPrev();
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
                                refAnnounce.current.slickNext();
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
                <div className="col-30 col-md-45 col-xl-20 col-xxl-22">
                    <div className="carousel-button d-none d-md-block d-xl-none">
                        <Link to="/auctions" className="btn btn-default">
                            {__("All auctions")}
                        </Link>
                    </div>
                    <div className="carousel-counter">
                        <span className="current">{state.slideIndex + 1}</span>/
                        <span className="total">{state.slidesTotal}</span>
                    </div>
                </div>
            </div>
            <div className="carousel-button d-md-none">
                <Link to="/auctions" className="btn btn-default">
                    {__("All auctions")}
                </Link>
            </div>
        </React.Fragment>
    );
}
