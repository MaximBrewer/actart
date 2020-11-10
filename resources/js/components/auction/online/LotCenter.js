import React from "react";
import __ from '../../../utils/trans';
import { useParams } from "react-router-dom";
import Carousel from "../carousel/Carousel";
export default function Center(props) {
    const { id, lotId } = useParams();
    return (
        <div className="auction-info">
            <div className="container">
                <Carousel {...props} id={id} lotId={lotId}/>
            </div>
        </div>
    );
}
