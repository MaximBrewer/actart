import React, { useState, useEffect } from "react";
import __ from "../utils/trans";
import Parser from "html-react-parser";
import { Link } from "react-router-dom";

export default function Announce(props) {
    const { req } = props;
    const [state, setState] = useState(window.App.announce);

    const updateAuctionStatus = event => {
        if (event.detail.id == state.id && event.detail.status != "coming") {
            req("/api/" + window.App.locale + "/auctions/announce")
                .then(({ auction }) => setState(auction))
                .catch(() => null);
        }
    };

    useEffect(() => {
        window.addEventListener("update-auction-status", updateAuctionStatus);
        return () => {
            window.removeEventListener(
                "update-auction-status",
                updateAuctionStatus
            );
        };
    }, []);

    return (
        state && (
            <section
                className="auction-announce"
                style={{
                    backgroundImage: `url(${encodeURI(state.narrow)})`,
                    backgroundPosition: `top center`
                }}
            >
                <div className="darkener">
                    <div className="container">
                        <div className="h1">{Parser(state.header_text ?? "")}</div>
                        <div className="h3">
                            {state.dateout} &nbsp;&nbsp;&nbsp;{" "}
                            <Link
                                to={`/auctions/` + state.id}
                                className="btn btn-default-inverse"
                            >
                                {__("#MORE_DETAILS_LINK#")}
                            </Link>
                        </div>
                    </div>
                </div>
            </section>
        )
    );
}
