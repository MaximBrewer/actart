import React, { useState, useEffect } from "react";
import AuctionPreviewLeftComing from "./coming/blocks/AuctionPreviewLeft";
import AuctionPreviewRightComing from "./coming/blocks/AuctionPreviewRight";
import AuctionPreviewLeftOnline from "./online/blocks/AuctionPreviewLeft";
import AuctionPreviewRightOnline from "./online/blocks/AuctionPreviewRight";

export default function AuctionList(props) {
    const [state, setState] = useState({
        auctions: []
    });

    const updateAuctionStatus = event => {
        setState(prevState => {
            let update = false;
            let auctions = prevState.auctions;
            for (let i in auctions) {
                if (event.detail.id == auctions[i].id) {
                    auctions[i].status = event.detail.status;
                    update = true;
                }
            }
            return update
                ? {
                    ...prevState,
                    auctions
                }
                : prevState;
        });
    };

    useEffect(() => {
        let auctions = [];
        for (let item of window.App.coming) {
            if (props.attr == item.attr) auctions.push(item);
        }
        setState({
            auctions: auctions
        });
        window.addEventListener("update-auction-status", updateAuctionStatus);
        return () => {
            window.removeEventListener(
                "update-auction-status",
                updateAuctionStatus
            );
        };
    }, []);

    return (
        <React.Fragment>
            {state.auctions.map((item, index) => (
                <div className="row auction-preview py-4" key={index}>
                    <div className="col-xl-40 col-xxl-38">
                        <div className="left-auction-side">
                            <hr className="d-xl-none" />
                            {item.status == "coming" ? (
                                <AuctionPreviewLeftComing
                                    auction={item}
                                    {...props}
                                />
                            ) : (
                                    ``
                                )}
                            {item.status == "started" ? (
                                <AuctionPreviewLeftOnline
                                    auction={item}
                                    {...props}
                                />
                            ) : (
                                    ``
                                )}
                        </div>
                    </div>
                    <div className="col-xl-20 col-xxl-22">
                        <div className="right-auction-side">
                            {item.status == "coming" ? (
                                <AuctionPreviewRightComing
                                    auction={item}
                                    {...props}
                                />
                            ) : (
                                    ``
                                )}
                            {item.status == "started" ? (
                                <AuctionPreviewRightOnline
                                    auction={item}
                                    {...props}
                                />
                            ) : (
                                    ``
                                )}
                            <hr className="d-xl-none" />
                        </div>
                    </div>
                </div>
            ))}
        </React.Fragment>
    );
}
