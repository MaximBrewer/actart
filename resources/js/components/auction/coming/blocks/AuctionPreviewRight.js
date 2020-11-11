import React from "react";
import Countdown from "../../Countdown";
import Parser from "html-react-parser";
import __ from "../../../../utils/trans";
import { Link } from "react-router-dom";
import { useAuth } from "../../../../context/auth";

export default function AuctionPreviewRight(props) {
    let { inAuctions } = useAuth();
    const { auction, participate } = props;
    return (
        <div className="banner-announce">
            <div className="row">
                <div className="h3 col-md-38 col-xl-60">
                    {Parser(auction.sublime)}
                </div>
                <div className="d-none d-md-flex d-xl-block col-22 col-xl-60">
                    <Countdown date={auction.dateatom} />
                </div>
            </div>
            <div className="text-xs-center mb-3">
                {inAuctions(auction.id) ? (
                    <Link
                        to={"/auctions/" + auction.id}
                        className="btn btn-danger"
                    >
                        {__("ALREADY_REGISTERED")}
                    </Link>
                ) : (
                    <Link
                        to={"/auctions/" + auction.id}
                        className="btn btn-danger"
                        onClick={e => participate(e, auction)}
                    >
                        {__("PARTICIPATE")}
                    </Link>
                )}
            </div>
            <Link
                to={"/auctions/" + auction.id}
                className="h5_underline d-none d-xl-block"
            >
                {__("View lots")} →
            </Link>
        </div>
    );
}
