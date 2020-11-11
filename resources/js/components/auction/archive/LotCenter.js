import React from "react";
import Carousel from "../carousel/Carousel";
export default function ArchiveCenter(props) {
    return (
        <div className="auction-info">
            <div className="container">
                <Carousel {...props}/>
            </div>
        </div>
    );
}
