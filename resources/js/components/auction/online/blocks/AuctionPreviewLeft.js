import React from "react";
import __ from '../../../../utils/trans';
import Parser from "html-react-parser";
export default function AuctionPreviewLeft(props) {
    return (
        <div>
            <div
                className="banner-image"
                style={{
                    backgroundImage: 'url("' + props.auction.thumbnail + '")'
                }}
            >
                <div className="banner-inner-text">
                    <div className="h1">{props.auction.announce_text}</div>
                    <div className="h2">{props.auction.date}</div>
                </div>
            </div>
        </div>
    );
}
