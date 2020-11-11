import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import AuctionComingTop from "./coming/LotTop.js";
import AuctionComingCenter from "./coming/LotCenter.js";
import AuctionComingBottom from "./coming/LotBottom.js";
import AuctionComingLotsList from "./coming/LotsList.js";
import AuctionOnlineTop from "./online/LotTop.js";
import AuctionOnlineCenter from "./online/LotCenter.js";
import AuctionOnlineBottom from "./online/LotBottom.js";
import AuctionOnlineLotsList from "./online/LotsList.js";
import AuctionArchiveTop from "./archive/LotTop.js";
import AuctionArchiveCenter from "./archive/LotCenter.js";
import AuctionArchiveBottom from "./archive/LotBottom.js";
import AuctionArchiveLotsList from "./archive/LotsList.js";
import useDocumentTitle from "../../components/document-title";
import __ from "../../utils/trans";

export default function Lot(props) {
    useDocumentTitle(__("LOT_IN_AUCTION_PAGE_TITLE"));
    const { auction } = props;

    const Top = props => {
        if (auction.title)
            switch (auction.status) {
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
        if (auction.title)
            switch (auction.status) {
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
        if (auction.title)
            switch (auction.status) {
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
        if (auction.title)
            switch (auction.status) {
                case "started":
                    return <AuctionOnlineBottom {...props} />;
                case "finished":
                    return <AuctionArchiveBottom {...props} />;
                case "coming":
                    return <AuctionComingBottom {...props} />;
            }
        return false;
    };
    return (
        <section className="auction-page-wrapper">
            {auction ? (
                <div className={`status-` + auction.status}>
                    <Top {...props} />
                    <div className="sticky-wrapper">
                        <Center {...props} />
                        <div className="auction-page-inner">
                            <div className="auction-works-list my-5">
                                <LotsList {...props} />
                            </div>
                            <div className="my-5">
                                <Bottom {...props} />
                            </div>
                        </div>
                        <div className="sticky-section">
                            <span>{auction.title}</span>
                        </div>
                    </div>
                </div>
            ) : (
                ""
            )}
        </section>
    );
}
