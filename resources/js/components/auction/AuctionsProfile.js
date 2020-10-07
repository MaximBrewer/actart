import React, { useState, useEffect } from "react";
import Countdown from "./Countdown";

export default function AuctionProfile(props) {
    const [state, setState] = useState({
        auctions: []
    });

    useEffect(() => {
        axios
            .get(
                "/api/" +
                    window.lang +
                    "/auctions/coming?ids=" +
                    (user.auctions.length ? user.auctions.join(",") : "0")
            )
            .then(res => {
                setState({
                    auctions: res.data.auctions
                });
            })
            .catch(err => {
                console.log(err);
            });
    }, []);

    return (
        <React.Fragment>
            {state.auctions.map((item, index) => (
                <div className="auction-preview" key={index}>
                    <div
                        className="banner-image"
                        style={{
                            backgroundImage: 'url("' + item.thumbnail + '")'
                        }}
                    >
                        <div className="countdown-wrapp">
                            <Countdown date={item.dateatom} />
                        </div>
                        <div className="banner-inner-text">
                            <div className="h1">{item.announce_text}</div>
                            <div className="h2">{item.date}</div>
                        </div>
                    </div>
                </div>
            ))}
        </React.Fragment>
    );
}
