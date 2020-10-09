import React from "react";
import __ from '../../../utils/trans';
import { Link } from "react-router-dom";

export default function Bottom(props) {
    const { auction, participate } = props;
    return (
        <div className="mb-5">
            <div className="container mb-5">
                <div className="footer-buttons">
                    <Link to="/auctions" className="btn btn-default">
                        {__("BTN_ALL_AUCTIONS")}
                    </Link>
                    <Link to="/gallery" className="btn btn-primary">
                        {__("BTN_ONLINE_GALLERY")}
                    </Link>
                </div>
            </div>
        </div>
    );
}
