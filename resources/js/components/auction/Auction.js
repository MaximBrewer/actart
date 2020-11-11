import React, { useState, useEffect } from "react";
import __ from "../../utils/trans";
import Countdown from "./Countdown";
import { Link, useParams } from "react-router-dom";
import { useAuth } from "../../context/auth";
import Waterfall from "../waterfall/Waterfall";
import Carousel from "./carousel/Carousel";

export default function Auction(props) {
    const { id } = useParams();

    const { participate } = props;
    let { inAuctions } = useAuth();

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
        state.auction.status == "coming" ? (
            <section className="auction-page-wrapper">
                <div className={`status-` + state.auction.status}>
                    <section
                        className="auction-announce auction-coming"
                        style={{
                            backgroundImage:
                                "url(" + state.auction.thumbnail + ")",
                            backgroundPosition: "top center"
                        }}
                    >
                        <div className="darkener">
                            <div className="container">
                                <Countdown date={state.auction.dateatom} />
                                <div className="h1">{state.auction.title}</div>
                                <div className="h3">
                                    {state.auction.date} &nbsp;&nbsp;&nbsp;
                                </div>
                            </div>
                        </div>
                    </section>
                    <div className="sticky-wrapper">
                        <div className="auction-info">
                            <div className="container">
                                <Carousel {...props} auction={state.auction} />
                            </div>
                        </div>
                        <div className="auction-page-inner">
                            <div className="auction-works-list my-5">
                                <div className="container">
                                    <div className="h3">
                                        {__("Auction lots")}
                                    </div>
                                    <Waterfall
                                        {...props}
                                        items={state.auction.lots}
                                        data={{
                                            auction: state.auction,
                                            entity: "lots",
                                            sortable: true,
                                            tizerView: "auction",
                                            view: {
                                                xs: 1,
                                                sm: 2,
                                                md: 2,
                                                lg: 4,
                                                xl: 4,
                                                xxl: 4
                                            }
                                        }}
                                    />
                                </div>
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
        )
    ) : (
        ``
    );
}
