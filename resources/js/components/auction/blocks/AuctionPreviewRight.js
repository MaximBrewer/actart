import React from "react";
import Countdown from "../Countdown";
import Parser from "html-react-parser";
import __ from '../../../utils/trans';
import { Link } from 'react-router-dom';


export default function AuctionPreviewRight(props) {
    return (
        <div className="banner-announce">
            <div className="row">
                <div className="h3 col-md-38 col-xl-60">
                    {Parser(props.auction.sublime)}
                </div>
                <div className="d-none d-md-flex d-xl-block col-22 col-xl-60">
                    <Countdown date={props.auction.dateatom} />
                </div>
            </div>
            <div className="text-xs-center mb-3">
                <Link
                    to={"/auctions/" + props.auction.id}
                    className="btn btn-danger"
                    onClick={e => {
                        e.preventDefault();
                        props.participate(props.auction.id);
                    }}
                >
                    {__("PARTICIPATE")}
                </Link>
            </div>
            <Link
                to={"/auctions/" + props.auction.id}
                className="h5_underline d-none d-xl-block"
            >
                {__("View lots")} →
            </Link>
        </div>
    );
}
