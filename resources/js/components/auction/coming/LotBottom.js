import React from "react";
import __ from '../../../utils/trans';
export default function Bottom(props) {
    const { auction, participate } = props;
    return (
        <div className="mb-5">
            <div className="container mb-5">
                <div className="footer-buttons">
                    <a href="/auctions" className="btn btn-default">
                        {__("BTN_ALL_AUCTIONS")}
                    </a>
                    <a href="/gallery" className="btn btn-primary">
                        {__("BTN_ONLINE_GALLERY")}
                    </a>
                </div>
            </div>
        </div>
    );
}
