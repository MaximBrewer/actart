import React from "react";
import { Link } from "react-router-dom";
import __ from '../../../utils/trans';

export default function ArchiveBottom(props) {
    return (
        <div className="auction-footer">
            <div className="container">
                <div className="row justify-content-center my-5">
                    <div className="col-lg-15 mb-2">
                        <Link to="/auctions" className="btn btn-default w-100">
                            {__("BTN_ALL_AUCTIONS")}
                        </Link>
                    </div>
                    <div className="col-lg-15">
                        <Link to="/gallery" className="btn btn-default w-100">
                            {__("BTN_ONLINE_GALLERY")}
                        </Link>
                    </div>
                </div>
                <div className="row justify-content-center my-5">
                    <div className="col-lg-15">
                        <Link to="/auctions/archive" className="btn btn-link">
                            {__("ARCHIVE_OF_AUCTIONS")}
                        </Link>
                    </div>
                </div>
            </div>
        </div>
    );
}
