import React from "react";
import Parser from "html-react-parser";
import __ from '../../../../utils/trans';
import { Link } from 'react-router-dom';

export default function AuctionPreviewRight(props) {
    const { auction } = props;
    return (
        <div className="banner-announce">
            <div className="row">
                <div className="h3 col-md-38 col-xl-60">
                    {Parser(auction.sublime ?? "")}
                </div>
                <div className="d-none d-md-flex d-xl-block col-22 col-xl-60">
                    <div className="banner-counter d-flex h3 h3 color-red">{__('AUCTION_FINISHED')}</div>
                </div>
            </div>
            <div className="text-xs-center mb-3">
                <Link
                    to={"/auctions/" + auction.id}
                    className="btn btn-secondary"
                >
                    {__("ARCHIVE_MORE_LINK")}
                </Link>
            </div>
        </div >
    );
}
