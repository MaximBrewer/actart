import React from "react";
import __ from '../../../utils/trans';
import { Link } from "react-router-dom";

export default function ArchiveTop(props) {
    const { auction } = props;
    return (
        <section
            className="auction-announce auction-archive"
            style={{
                backgroundImage: "url(" + auction.thumbnail + ")",
                backgroundPosition: "top center"
            }}
        >
            <div className="darkener">
                <div className="container">
                    <Link
                        to={`/auctions/` + state.id}
                        className="btn btn-default-inverse"
                    >
                        <div className="h1">{auction.title}</div>
                    </Link>
                    <div className="h3">{auction.date} &nbsp;&nbsp;&nbsp;{__('BIDDING_FINISHED_TEXT')}</div>
                </div>
            </div>
        </section>
    );
}
