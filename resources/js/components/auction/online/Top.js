import React from "react";
import __ from "../../../utils/trans";
import Countdown from "../Countdown";
import { Link } from "react-router-dom";

export default function OnlineTop(props) {
    const { auction } = props;
    return (
        <section
            className="auction-announce auction-online"
            style={{
                backgroundImage: `url(${encodeURI(auction.thumbnail)})`,
                backgroundPosition: "top center"
            }}
        >
            <div className="darkener">
                <div className="container">
                    <Countdown date={auction.dateatom} />
                    <div className="h1">
                        <Link to={`/auctions/` + auction.id}>
                            {auction.header_text}
                        </Link>
                        <br />
                        {!props.finished ? (
                            <span className="online">
                                {__("#ONLINE_BROADCAST_IN_PROPGRESS_TEXT#")}
                            </span>
                        ) : (
                            <span className="online">
                                {__("#ONLINE_BROADCAST_HAS_FINISHED_TEXT#")}
                            </span>
                        )}
                    </div>
                </div>
            </div>
        </section>
    );
}
