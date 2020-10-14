import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import AuctionComingTop from "./coming/LotTop.js";
import AuctionComingCenter from "./coming/LotCenter.js";
import AuctionComingBottom from "./coming/LotBottom.js";
import AuctionComingLotsList from "./coming/LotsList.js";
import AuctionOnlineTop from "./online/LotTop.js";
import AuctionOnlineCenter from "./online/LotCenter.js";
import AuctionOnlineBottom from "./online/LotBottom.js";
import AuctionOnlineLotsList from "./coming/LotsList.js";
import AuctionArchiveTop from "./archive/LotTop.js";
import AuctionArchiveCenter from "./archive/LotCenter.js";
import AuctionArchiveBottom from "./archive/LotBottom.js";
import AuctionArchiveLotsList from "./coming/LotsList.js";

export default function Lot(props) {
    const { id, lotId } = useParams();

    const [state, setState] = useState({
        auction: null
    });

    const updateAuction = event => {
        setState(prevState => {
            return {
                ...prevState,
                auction: event.detail.auction
            };
        });
    };

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
        window.addEventListener("auction", updateAuction);
    }, []);

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
    useEffect(() => {
        window.scrollTo(0, 0);
    }, [lotId]);
    return (
        <section className="auction-page-wrapper">
            {state.auction ? (
                <div className={`status-` + state.auction.status}>
                    <Top {...props}  auction={state.auction}/>
                    <div className="sticky-wrapper">
                        <div className="auction-page-inner">
                            <Center {...props} auction={state.auction} />
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
            ) : (
                    ""
                )}
        </section>
    );
}
