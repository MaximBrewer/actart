import React from "react";
import { useParams } from "react-router-dom";
import Carousel from "../carousel/Carousel";
export default function ArchiveCenter(props) {
    const { id, lotId } = useParams();
    return (
        <div className="auction-info">
            <div className="container">
                <Carousel {...props} id={id} lotId={lotId}/>
            </div>
        </div>
    );
}
