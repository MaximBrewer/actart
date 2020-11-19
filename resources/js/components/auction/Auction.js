import React, { useState, useEffect } from "react";
import __ from "../../utils/trans";
import Carousel from "./carousel/Carousel";
import AuctionComingTop from "./coming/Top.js";
import AuctionComingLotTop from "./coming/LotTop.js";
import AuctionComingCenter from "./coming/Center.js";
import AuctionComingBottom from "./coming/Bottom.js";
import AuctionComingLotBottom from "./coming/LotBottom.js";
import AuctionComingLotsList from "./coming/LotsList.js";
import AuctionOnlineTop from "./online/Top.js";
import AuctionOnlineLotTop from "./online/LotTop.js";
import AuctionOnlineCenter from "./online/Center.js";
import AuctionOnlineBottom from "./online/Bottom.js";
import AuctionOnlineLotBottom from "./online/LotBottom.js";
import AuctionOnlineLotsList from "./online/LotsList.js";
import AuctionArchiveTop from "./archive/Top.js";
import AuctionArchiveLotTop from "./archive/LotTop.js";
import AuctionArchiveCenter from "./archive/Center.js";
import AuctionArchiveBottom from "./archive/Bottom.js";
import AuctionArchiveLotBottom from "./archive/LotBottom.js";
import AuctionArchiveLotsList from "./archive/LotsList.js";
import {
    Link,
    useLocation,
    useHistory,
    useRouteMatch,
    useParams
} from "react-router-dom";

export default function Auction(props) {
    const { id } = useParams();

    const [state, setState] = useState({
        auction: null
    });

    const { url } = useRouteMatch();
    const { pathname } = useLocation();

    useEffect(() => {}, [pathname]);

    const lotId =
        (pathname == url ? false : pathname.replace(url + "/lot/", "")) * 1;

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
            if (event.detail.id == prevState.auction.id)
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
                    return lotId ? (
                        <AuctionOnlineLotTop {...props} />
                    ) : (
                        <AuctionOnlineTop {...props} />
                    );
                case "finished":
                    return lotId ? (
                        <AuctionArchiveLotTop {...props} />
                    ) : (
                        <AuctionArchiveTop {...props} />
                    );
                case "coming":
                    return lotId ? (
                        <AuctionComingLotTop {...props} />
                    ) : (
                        <AuctionComingTop {...props} />
                    );
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
                    return lotId ? (
                        <AuctionOnlineLotBottom {...props} />
                    ) : (
                        <AuctionOnlineBottom {...props} />
                    );
                case "finished":
                    return lotId ? (
                        <AuctionArchiveLotBottom {...props} />
                    ) : (
                        <AuctionArchiveBottom {...props} />
                    );
                case "coming":
                    return lotId ? (
                        <AuctionComingLotBottom {...props} />
                    ) : (
                        <AuctionComingBottom {...props} />
                    );
            }
        return false;
    };

    return state.auction ? (
        <section className="auction-page-wrapper">
            <div className={`status-` + state.auction.status}>
                <Top auction={state.auction} />
                <div className="sticky-wrapper">
                    {lotId ? (
                        <div className="auction-info">
                            <div className="container">
                                <Carousel {...props} auction={state.auction} />
                            </div>
                        </div>
                    ) : (
                        <Center {...props} auction={state.auction} />
                    )}
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
