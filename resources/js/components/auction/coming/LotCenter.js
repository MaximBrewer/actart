import React from "react";
import __ from '../../../utils/trans';
import { Link, useParams } from "react-router-dom";
import Carousel from "../carousel/Carousel";
export default function Center(props) {
    const { id } = useParams();
    const { auction } = props;
    return (
        <div className="auction-info">
            <div className="container">
                <Carousel {...props} id={id} />
            </div>
        </div>
    );
}
