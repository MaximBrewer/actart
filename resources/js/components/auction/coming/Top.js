import React from "react";
import __ from '../../../utils/trans';
import Countdown from "../Countdown";

export default function Top(props) {
    const { auction } = props;
    return (
        <section
            className="auction-announce auction-coming"
            style={{
                backgroundImage: "url(" + auction.thumbnail + ")",
                backgroundPosition: "top center"
            }}
        >
            <div className="darkener">
                <div className="container">
                    <Countdown date={auction.dateatom} />
                    <Link
                        to={`/auctions/` + state.id}
                        className="btn btn-default-inverse"
                    >
                        <div className="h1">{auction.title}</div>
                    </Link>
                    <div className="h3">{auction.date} &nbsp;&nbsp;&nbsp;</div>
                </div>
            </div>
        </section>
    );
}
