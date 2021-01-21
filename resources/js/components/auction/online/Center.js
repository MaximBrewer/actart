import React, { useState, useEffect } from "react";
import Right from "./blocks/Right";
import __ from "../../../utils/trans";
import Parser from "html-react-parser";
import Lightbox from "react-image-lightbox";
import { size } from "lodash";

export default function Center(props) {
    const { auction, finished, started } = props;

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
                                    {auction.current ? (
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
                                                alt={auction.current.thumbnail}
                                                style={{
                                                    cursor: "pointer",
                                                    display: "block",
                                                    position: "relative",
                                                    backgroundSize: "contain",
                                                    backgroundRepeat:
                                                        "no-repeat",
                                                    backgroundPosition:
                                                        "center",
                                                    paddingTop: "65%",
                                                    backgroundColor: "#ECEDED",
                                                    backgroundImage:
                                                        'url("' +
                                                        auction.current
                                                            .thumbnail +
                                                        '")'
                                                }}
                                            ></div>
                                            {state.lbOpen && (
                                                <Lightbox
                                                    mainSrc={
                                                        auction.current.photo
                                                    }
                                                    onCloseRequest={() =>
                                                        setState(prevState => ({
                                                            ...prevState,
                                                            lbOpen: false
                                                        }))
                                                    }
                                                />
                                            )}
                                        </div>
                                    ) : (
                                        ``
                                    )}
                                    <div
                                        className={`current d-flex justify-content-between py-2`}
                                    >
                                        <div className="h2 color-red">
                                            {auction.current
                                                ? __("LOT_TEXT_LOT_ID") +
                                                  ` ` +
                                                  auction.current.id
                                                : ``}
                                        </div>
                                        <div
                                            style={{
                                                width: "100%",
                                                maxWidth: "340px"
                                            }}
                                        >
                                            <div
                                                style={{
                                                    paddingTop: "76.47%",
                                                    height: 0,
                                                    position: "relative"
                                                }}
                                                className={`translation-wrapper`}
                                            >
                                                {Parser(state.translation)}
                                            </div>
                                            <small className="text-red">
                                                {__("TRANSLATION_HELP")}
                                            </small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div className="col-xl-20 col-xxl-22">
                            <div className="right-side">
                                {auction.current ? (
                                    <Right item={auction.current} {...props} />
                                ) : !started ? (
                                    <h3
                                        className={`py-5 text-center color-red`}
                                    >
                                        {__("#AUCTION_WILL_START_SOON#")}
                                    </h3>
                                ) : !finished ? (
                                    <h3
                                        className={`py-5 text-center color-red`}
                                    >
                                        {__("#WAIT_NEXT_LOT#")}
                                    </h3>
                                ) : (
                                    <h3
                                        className={`py-5 text-center color-red`}
                                    >
                                        {__("#AUCTION_HAS_FINISHED#")}
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
