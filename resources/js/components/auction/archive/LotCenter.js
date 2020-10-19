import React from "react";
import { Link, useParams } from "react-router-dom";
import Carousel from "../carousel/Carousel";
export default function ArchiveCenter(props) {
    const { id } = useParams();
    const { auction } = props;
    return (
        <div className="auction-info">
            <div className="container">
                <Carousel {...props} id={id} items={auction.lots} />
            </div>
        </div>
    );
}
