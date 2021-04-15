import React, { useState, useEffect } from "react";
import { TransformWrapper, TransformComponent } from "react-zoom-pan-pinch";
import { ZoomIn, ZoomOut, ZoomReset } from "../../../icons/icons";
import __ from "../../../utils/trans";
import Lightbox from "react-image-lightbox";

export default function Left(props) {
    const [state, setState] = useState({
        item: props.item,
        photo: props.item.photos.length ? props.item.photos[0] : ``,
        open: false
    });

    return (
        <div className="lot-carousel-left">
            <div
                style={{
                    // backgroundColor: "#C4C4C4",
                    position: "relative"
                }}
            >
                <div
                    style={{
                        width: "100%",
                        paddingTop: "82.3529%",
                        display: "block",
                        position: "relative",
                        backgroundImage: `url(${encodeURI(state.photo.thumbnail)})`,
                        backgroundRepeat: "no-repeat",
                        backgroundSize: "contain",
                        backgroundPosition: "bottom center"
                    }}
                    onClick={() =>
                        setState(prevState => ({
                            ...prevState,
                            open: true
                        }))
                    }
                ></div>
                {state.open && (
                    <Lightbox
                        mainSrc={state.photo.full}
                        onCloseRequest={() =>
                            setState(prevState => ({
                                ...prevState,
                                open: false
                            }))
                        }
                    />
                )}
            </div>
            {state.item.photos.length > 1 ? (
                <div className="thumbnails d-flex justify-content-center">
                    {state.item.photos.map((photo, index) => (
                        <div key={index} style={{ width: "7.5rem" }}>
                            <div style={{ padding: ".5rem .7rem" }}>
                                <div
                                    className="thumbnail"
                                    onClick={e => {
                                        e.preventDefault();
                                        setState(prevState => {
                                            return {
                                                ...prevState,
                                                photo: photo
                                            };
                                        });
                                    }}
                                    style={{
                                        backgroundImage: `url(${encodeURI(
                                            photo.thumbnail
                                        )})`,
                                        backgroundPosition: "bottom center",
                                        backgroundRepeat: "no-repeat",
                                        backgroundSize: "contain",
                                        backgroundColor: "#C4C4C4",
                                        paddingTop: "66.6667%"
                                    }}
                                ></div>
                            </div>
                        </div>
                    ))}
                </div>
            ) : (
                ``
            )}
        </div>
    );
}
