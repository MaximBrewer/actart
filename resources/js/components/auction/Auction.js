import React, { useState, useEffect } from "react";
import __ from "../../utils/trans";
import { Link, useParams } from "react-router-dom";
import Carousel from "./carousel/Carousel";
import AuctionComingTop from "./coming/Top.js";
import AuctionComingCenter from "./coming/Center.js";
import AuctionComingBottom from "./coming/Bottom.js";
import AuctionComingLotsList from "./coming/LotsList.js";
import AuctionOnlineTop from "./online/Top.js";
import AuctionOnlineCenter from "./online/Center.js";
import AuctionOnlineBottom from "./online/Bottom.js";
import AuctionOnlineLotsList from "./online/LotsList.js";
import AuctionArchiveTop from "./archive/Top.js";
import AuctionArchiveCenter from "./archive/Center.js";
import AuctionArchiveBottom from "./archive/Bottom.js";
import AuctionArchiveLotsList from "./archive/LotsList.js";

export default function Auction(props) {

    const { id } = useParams();

    const [state, setState] = useState({
        auction: null
    });

    useEffect(() => {
        axios
            .get("/api/" + window.App.locale + "/auctions/" + id)
            .then(res => {
                setState({
                    auction: res.data.auction
                });
            })
            .catch(err => {
                console.log(err);
            });
        window.addEventListener("update-auction-status", updateAuctionStatus);
        return () => {
            window.removeEventListener(
                "update-auction-status",
                updateAuctionStatus
            );
        };
    }, []);

    const updateAuctionStatus = event => {
        setState(prevState => {
            if (event.detail.id == prevstate.auction.id)
                return {
                    ...prevState,
                    auction: {
                        ...prevState.auction,
                        status: event.detail.status
                    }
                };
            else return prevState;
        });
    };

    const Top = props => {
        if (state.auction.title)
            switch (state.auction.status) {
                case "started":
                    return <AuctionOnlineTop {...props} />;
                case "finished":
                    return <AuctionArchiveTop {...props} />;
                case "coming":
                    return <AuctionComingTop {...props} />;
            }
        return false;
    };
    const Center = props => {
        if (state.auction.title)
            switch (state.auction.status) {
                case "started":
                    return <AuctionOnlineCenter {...props} />;
                case "finished":
                    return <AuctionArchiveCenter {...props} />;
                case "coming":
                    return <AuctionComingCenter {...props} />;
            }
        return false;
    };
    const LotsList = props => {
        if (state.auction.title)
            switch (state.auction.status) {
                case "started":
                    return <AuctionOnlineLotsList {...props} />;
                case "finished":
                    return <AuctionArchiveLotsList {...props} />;
                case "coming":
                    return <AuctionComingLotsList {...props} />;
            }
        return false;
    };
    const Bottom = props => {
        if (state.auction.title)
            switch (state.auction.status) {
                case "started":
                    return <AuctionOnlineBottom {...props} />;
                case "finished":
                    return <AuctionArchiveBottom {...props} />;
                case "coming":
                    return <AuctionComingBottom {...props} />;
            }
        return false;
    };

    return state.auction ? (
        <section className="auction-page-wrapper">
            <div className={`status-` + state.auction.status}>
                <Top auction={state.auction} />
                <div className="sticky-wrapper">

                    <div className="auction-info">
                        <div className="container">
                            <Carousel {...props} auction={state.auction} />
                        </div>
                    </div>

                    <div className="auction-page-inner">
                        <div className="auction-works-list my-5">
                            <LotsList {...props} auction={state.auction} />
                        </div>
                        <div className="my-5">
                            <Bottom {...props} auction={state.auction} />
                        </div>
                    </div>
                    <div className="sticky-section">
                        <span>{state.auction.title}</span>
                    </div>
                </div>
            </div>
        </section>
    ) : (
        ``
    );
}
