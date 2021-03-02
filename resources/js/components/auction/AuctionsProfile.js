import React, { useState, useEffect } from "react";
import { useAuth } from "../../context/auth";
import Countdown from "./Countdown";
import { Link } from "react-router-dom";

export default function AuctionProfile(props) {
    const { currentUser, setCurrentUser } = useAuth();

    const [state, setState] = useState({
        auctions: currentUser.auctions
    });

    useEffect(() => {
        setState({
            auctions: currentUser.auctions
        });
    }, [currentUser]);

    useEffect(() => {
        window.addEventListener("update-auction-status", updateAuctionStatus);
        return () => {
            window.removeEventListener(
                "update-auction-status",
                updateAuctionStatus
            );
        };
    }, []);

    const updateAuctionStatus = event => {
        if (
            event.detail.status == "canceled" ||
            event.detail.status == "finished"
        ) {
            setCurrentUser(prevState => {
                let update = false,
                    as = [];
                for (let auction of prevState.auctions) {
                    if (event.detail.id == auction.id) update = true;
                    else as.push(auction);
                }
                if (update)
                    return {
                        ...prevState,
                        auctions: as
                    };
                else return prevState;
            });
        }
    };

    return (
        <React.Fragment>
            {state.auctions.map((item, index) => (
                <Link
                    to={`/auctions/` + item.id}
                    className="auction-preview"
                    key={index}
                    style={{ display: "block" }}
                >
                    <div
                        className="banner-image"
                        style={{
                            backgroundImage: `url(${encodeURI(item.thumbnail)})`
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
                </Link>
            ))}
        </React.Fragment>
    );
}
