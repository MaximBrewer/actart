import React from "react";
import { ArrowPrew, ArrowNext } from "../../../icons/icons";
import __ from '../../../utils/trans';

export default function Footer(props) {
    const { data, state, refPicture } = props;
    if (window.innerWidth < grid[data.minView]) {
        return (
            <div className="show-more">
                <div className="dots">•••</div>
                <a href="/gallery" className="text">
                    Показать больше
                </a>
            </div>
        );
    } else {
        return (
            <React.Fragment>
                <div className="carousel-controls">
                    <div className="carousel-button">
                        <a href="/news" className="btn btn-default">
                            {__("ЧИТАТЬ")}
                        </a>
                    </div>

                    <div className="carousel-counter">
                        <span className="current">{state.slideIndex + 1}</span>/
                        <span className="total">{state.slidesTotal}</span>
                    </div>
                    <div className="carousel-arrows">
                        <a
                            className="btn btn-default btn-control d-flex"
                            onClick={() => {
                                refPicture.current.slickPrev();
                            }}
                        >
                            <ArrowPrew />
                        </a>
                        <a
                            className="btn btn-default btn-control d-flex"
                            onClick={() => {
                                refPicture.current.slickNext();
                            }}
                        >
                            <ArrowNext />
                        </a>
                    </div>
                </div>
            </React.Fragment>
        );
    }
}
