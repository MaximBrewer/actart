import React from "react";
import AuctionComingTop from "./coming/Top.js";
import AuctionComingCenter from "./coming/Center.js";
import AuctionComingBottom from "./coming/Bottom.js";
import AuctionComingLotsList from "./coming/LotsList.js";
import AuctionOnlineTop from "./online/Top.js";
import AuctionOnlineCenter from "./online/Center.js";
import AuctionOnlineBottom from "./online/Bottom.js";
import AuctionOnlineLotsList from "./coming/LotsList.js";
import AuctionArchiveTop from "./archive/Top.js";
import AuctionArchiveCenter from "./archive/Center.js";
import AuctionArchiveBottom from "./archive/Bottom.js";
import AuctionArchiveLotsList from "./coming/LotsList.js";

export default function AuctionBase(props) {
    const { auction } = props;
    const Bottom = props => {
        if (props.auction.title)
            switch (props.auction.status) {
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
        if (props.auction.title)
            switch (props.auction.status) {
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
        if (props.auction.title)
            switch (props.auction.status) {
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
        if (props.auction.title)
            switch (props.auction.status) {
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
