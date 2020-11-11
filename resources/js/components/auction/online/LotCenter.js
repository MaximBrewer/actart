import React from "react";
import __ from '../../../utils/trans';
import Carousel from "../carousel/Carousel";
export default function Center(props) {
    return (
        <div className="auction-info">
            <div className="container">
                <Carousel {...props}/>
            </div>
        </div>
    );
}
