import React, { useState, useEffect } from "react";
import { useAuth } from '../../context/auth';
import Countdown from "./Countdown";

export default function AuctionProfile(props) {
    let { currentUser } = useAuth();

    return (
        <React.Fragment>
            {currentUser.auctions.map((item, index) => (
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
