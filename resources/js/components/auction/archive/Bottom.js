import React from "react";
import { Link } from "react-router-dom";

export default function Bottom(props) {
    const { auction, participate } = props;
    return (
        <div className="auction-footer">
            <div className="container">
                <div className="row justify-content-center my-5">
                    <div className="col-lg-15">
                        <Link to="/auctions" className="btn btn-default w-100">
                            {__("All auctions")}
                        </Link>
                    </div>
                    <div className="col-lg-15">
                        <Link to="/gallery" className="btn btn-default w-100">
                            {__("Online-gallery")}
                        </Link>
                    </div>
                </div>
                <div className="row justify-content-center my-5">
                    <div className="col-lg-15">
                        <Link to="/auctions" className="btn btn-link">
                            {__("Archive of auctions")}
                        </Link>
                    </div>
                </div>
            </div>
        </div>
    );
}
