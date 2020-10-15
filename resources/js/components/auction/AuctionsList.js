import React, { useState, useEffect } from "react";
import AuctionPreviewLeft from "./coming/blocks/AuctionPreviewLeft";
import AuctionPreviewRight from "./coming/blocks/AuctionPreviewRight";

export default function AuctionList(props) {
    const [state, setState] = useState({
        auctions: []
    });

    useEffect(() => {
        let auctions = [];
        for (let item of window.App.coming) {
            if (props.attr == item.attr)
                auctions.push(item)
        }
        setState({
            auctions: auctions
        });
    }, []);

    return (
        <React.Fragment>
            {state.auctions.map((item, index) => (
                <div className="row auction-preview py-4" key={index}>
                    <div className="col-xl-40 col-xxl-38">
                        <div className="left-auction-side">
                            <hr className="d-xl-none" />
                            <AuctionPreviewLeft
                                auction={item}
                                {...props}
                            />
                        </div>
                    </div>
                    <div className="col-xl-20 col-xxl-22">
                        <div className="right-auction-side">
                            <AuctionPreviewRight
                                auction={item}
                                {...props}
                            />
                            <hr className="d-xl-none" />
                        </div>
                    </div>
                </div>
            ))}
        </React.Fragment>
    );
}
