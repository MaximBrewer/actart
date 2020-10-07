import React from "react";
import { ArrowPrew, ArrowNext } from "../../../icons/icons";
import __ from '../../../utils/trans';

export default function Footer(props) {
    const { data, state, refPicture } = props;
    if (window.innerWidth < grid[data.minView]) {
        return (
            <React.Fragment>
                <p className="d-none d-md-block d-lg-none">
                    Платформа Act-Art – независимый коммерческий проект. Наша
                    цель – популяризация современного российского искуства в
                    России и мире. Мы помогаем молодым и именитым авторам найти
                    своего зрителя и ценителя, делая процесс приобретения
                    произведений максимально удобным и демократичным.
                </p>
                <div className="text-center button-wrapper pt-4">
                    <a href="#" className="btn btn-default">
                        ВСЕ АННОНСЫ
                    </a>
                </div>
            </React.Fragment>
        );
    } else {
        return (
            <React.Fragment>
                <div className="carousel-controls">
                    <div className="carousel-button">
                        <a href="#" className="btn btn-default">
                            ВСЕ АННОНСЫ
                        </a>
                    </div>
                    <div className="carousel-counter">
                        <span className="current">
                            {state.slideIndex + 1}
                        </span>
                        /
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
