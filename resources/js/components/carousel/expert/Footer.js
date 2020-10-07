import React from "react";
import { ArrowPrew, ArrowNext } from "../../../icons/icons";
import __ from '../../../utils/trans';

export default function Footer(props) {
    const { data, state, refPicture } = props;
    return (
        <React.Fragment>
            <div className="row">
                <div className="col col-md-40">
                    <div className="carousel-description">
                        <p className="sub_h2">
                            Платформа Акт-Арт представляет три творческих
                            кластера с собственными творческими мастерскими и
                            выставочными галереями. Все кластеры находятся в
                            историческом центре Москвы и далее какой-то текст.
                            Все кластеры находятся в историческом центре Москвы
                            и далее какой-то текст. Все кластеры находятся в
                            историческом центре Москвы.
                        </p>
                    </div>
                </div>
                <div className="col col-md-20">
                    <div className="d-flex justify-content-end">
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
                        <div className="carousel-counter">
                            <span className="current">
                                {state.slideIndex + 1}
                            </span>
                            /<span className="total">{state.slidesTotal}</span>
                        </div>
                    </div>
                </div>
            </div>
        </React.Fragment>
    );
}
