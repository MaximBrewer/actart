import React, { useState, useEffect } from "react";
import Right from "./blocks/Right";
import __ from "../../../utils/trans";
import Parser from "html-react-parser";
import Lightbox from "react-image-lightbox";
import { size } from "lodash";

export default function Center(props) {

    const { auction, finished } = props;

    const [state, setState] = useState({
        translation: window.App.translation,
        lbOpen: false
    });

    const updateTranslation = event => {
        setState(prevState => ({
            ...prevState,
            translation: event.detail.translation
        }));
    };

    useEffect(() => {
        window.addEventListener("update-translation", updateTranslation);
        return () => {
            window.removeEventListener("update-translation", updateTranslation);
        };
    }, []);

    return (
        <div className="auction-info">
            <div className="container">
                <div className="lot-carousel">
                    <div className="row">
                        <div className="col-xl-40 col-xxl-38">
                            <div className="left-side">
                                <div>
                                    {auction.current ?
                                        (
                                            <div
                                                style={{
                                                    width: "100%"
                                                }}
                                            >
                                                <div
                                                    onClick={() =>
                                                        setState(prevState => ({
                                                            ...prevState,
                                                            lbOpen: true
                                                        }))
                                                    }
                                                    className="image"
                                                    alt={
                                                        auction.current
                                                            .thumbnail
                                                    }
                                                    style={{
                                                        cursor: "pointer",
                                                        display: "block",
                                                        position: "relative",
                                                        backgroundSize:
                                                            "contain",
                                                        backgroundRepeat:
                                                            "no-repeat",
                                                        backgroundPosition:
                                                            "center",
                                                        paddingTop: "65%",
                                                        backgroundColor:
                                                            "#ECEDED",
                                                        backgroundImage:
                                                            'url("' +
                                                            auction
                                                                .current
                                                                .thumbnail +
                                                            '")'
                                                    }}
                                                ></div>
                                                {state.lbOpen && (
                                                    <Lightbox
                                                        mainSrc={
                                                            auction
                                                                .current
                                                                .photo
                                                        }
                                                        onCloseRequest={() =>
                                                            setState(
                                                                prevState => ({
                                                                    ...prevState,
                                                                    lbOpen: false
                                                                })
                                                            )
                                                        }
                                                    />
                                                )}
                                            </div>
                                        ) : ``
                                    }
                                    <div
                                        className={`current d-flex justify-content-between py-2`}
                                    >
                                        <div className="h2 color-red" style={{ fontSize: "2.5rem" }}>{auction.current ? __("LOT_TEXT_LOT_ID") + auction.current.id : ``}</div>
                                        <div style={{ width: "40%" }}>
                                            <div
                                                style={{
                                                    paddingTop: "56.25%",
                                                    height: 0,
                                                    position: "relative"
                                                }}
                                                className={`translation-wrapper`}
                                            >
                                                {Parser(state.translation)}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div className="col-xl-20 col-xxl-22">
                            <div className="right-side">
                                {auction.current ? (
                                    <Right
                                        item={auction.current}
                                        {...props}
                                    />
                                ) : (
                                        <h3
                                            className={`py-5 text-center color-red`}
                                        >
                                            {!finished
                                                ? __("#AUCTION_WILL_START_SOON#")
                                                : __("#AUCTION_HAS_FINISHED#")}
                                        </h3>
                                    )}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}
