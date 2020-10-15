import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
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
import useDocumentTitle from '../../components/document-title';
import __ from '../../utils/trans';
import client from '../../api/client';

export default function AuctionBase(props) {
    useDocumentTitle(__('AUCTIONS_PAGE_TITLE'));
    const { id } = useParams();

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
        client('/api/' + window.App.locale + "/auctions/" + id)
            .then(({ auction }) =>
                setState({
                    auction: auction
                })
            )
            .catch(() => null);
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
    return (
        <section className="auction-page-wrapper">
            {state.auction ? (
                <div className={`status-` + state.auction.status}>
                    <Top {...props} auction={state.auction} />
                    <div className="sticky-wrapper">
                        <Center {...props} auction={state.auction} />
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
