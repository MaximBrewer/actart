import React, { useState, useEffect } from "react";
import Right from "./blocks/Right";
import __ from "../../../utils/trans";
import Parser from "html-react-parser";
import Lightbox from "react-image-lightbox";
import { size } from "lodash";
import YouTube from "react-youtube";

export default function Center(props) {
    const { auction, finished, started } = props;

    const [state, setState] = useState({
        translation: window.App.translation,
        lbOpen: false
    });

    let player;

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

    const opts = {
        width: "360px",
        height: "240px",
        videoId: state.translation,
        playerVars: {
            autoplay: 1,
            playsinline: 1,
            controls: 1,
            modestbranding: 1,
            showinfo: 0,
            fs: 0,
            iv_load_policy: 3
        }
    };

    const onPlayerReady = event => {
        event.target.mute();
        event.target.playVideo();
        player = event.target();
    };

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
                                                    backgroundImage: `url(${encodeURI(
                                                        auction.current
                                                            .thumbnail
                                                    )})`
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
                                        <div className="h2 color-red d-none d-sm-block">
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
                                                    paddingTop: "58.82%",
                                                    height: 0,
                                                    position: "relative"
                                                }}
                                                className={`translation-wrapper`}
                                            >
                                                <YouTube
                                                    id="translationEl"
                                                    videoId={state.translation}
                                                    opts={opts}
                                                    onReady={onPlayerReady}
                                                />
                                                <button
                                                    // style="width: 178px; height: 16px; line-height: 16px; padding-top: 0px;"
                                                    type="button"
                                                    onClick={() =>
                                                        player.unMute()
                                                    }
                                                >
                                                    {__("#TURN_VOICE_ON#")}
                                                </button>
                                                <button
                                                    // style="width: 178px; height: 16px; line-height: 16px; padding-top: 0px;"
                                                    type="button"
                                                    onClick={() =>
                                                        player.mute()
                                                    }
                                                >
                                                    {__("#TURN_VOICE_OFF#")}
                                                </button>
                                            </div>
                                            <small className="color-red">
                                                {__("#TRANSLATION_HELP#")}
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
