import React, { useState, useEffect, useRef } from "react";
import Slider from "react-slick";
import ReactImageMagnify from "react-image-magnify";
import Zoom from "react-img-zoom";
import { PinchView } from "react-pinch-zoom-pan";
import { TransformWrapper, TransformComponent } from "react-zoom-pan-pinch";

export default function LotGallery(props) {
    const slider = useRef();
    const thumbSetting = {
        dots: false,
        infinite: false,
        speed: 500,
        slidesToShow: 4,
        slidesToScroll: 4
    };
    const setting = {
        dots: false,
        infinite: false,
        speed: 500,
        slidesToShow: 1,
        slidesToScroll: 1
    };
    const [state, setState] = useState({
        lot: {
            photos: []
        }
    });

    useEffect(() => {
        axios
            .get("/api/" + window.lang + "/lot/" + props.data.id)
            .then(res => {
                setState({
                    lot: res.data.lot
                });
            })
            .catch(err => {
                console.log(err);
            });
    }, []);

    return (
        <React.Fragment>
            <Slider {...setting} ref={slider}>
                {state.lot.photos.map((item, index) => {
                    let w =
                        item.pxwidth / item.pxheight > 680 / 560
                            ? 680
                            : (item.pxwidth / item.pxheight) * 560;
                    let h =
                        item.pxwidth / item.pxheight < 680 / 560
                            ? 560
                            : (item.pxheight / item.pxwidth) * 680;
                    return (
                        <div key={index}>
                            <div
                                style={{
                                    backgroundColor: "#C4C4C4",
                                    position: "relative"
                                }}
                            >
                                <TransformWrapper
                                    defaultScale={1}
                                    defaultPositionX={0}
                                    defaultPositionY={0}
                                >
                                    {({
                                        zoomIn,
                                        zoomOut,
                                        resetTransform,
                                        ...rest
                                    }) => (
                                        <React.Fragment>
                                            <TransformComponent>
                                                <div
                                                    style={{
                                                        width: "100%",
                                                        paddingTop: "82.3529%",
                                                        display: "block",
                                                        position: "relative",
                                                        backgroundImage:
                                                            "url(" +
                                                            item.full +
                                                            ")",
                                                        backgroundRepeat:
                                                            "no-repeat",
                                                        backgroundSize:
                                                            "contain",
                                                        backgroundPosition:
                                                            "bottom center"
                                                    }}
                                                >
                                                    &nbsp;
                                                </div>
                                            </TransformComponent>
                                            <div className="tools">
                                                <button onClick={zoomIn}>
                                                    +
                                                </button>
                                                <button onClick={zoomOut}>
                                                    -
                                                </button>
                                                <button
                                                    onClick={resetTransform}
                                                >
                                                    x
                                                </button>
                                            </div>
                                        </React.Fragment>
                                    )}
                                </TransformWrapper>
                            </div>
                        </div>
                    );
                })}
            </Slider>
            <Slider {...thumbSetting}>
                {state.lot.photos.map((item, index) => (
                    <div key={index}>
                        <div style={{ padding: ".5rem .7rem" }}>
                            <div
                                className="thumbnail"
                                onClick={e => slider.current.slickGoTo(index)}
                                style={{
                                    backgroundImage: `url(` + item.full + `)`,
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
            </Slider>
        </React.Fragment>
    );
}
