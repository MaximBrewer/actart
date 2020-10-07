import React from "react";
import __ from '../../../utils/trans';
import Countdown from "../Countdown";
export default function Bottom(props) {
    const { auction, participate } = props;
    return (
        <div className="auction-footer">
            <div className="container">
                <div className="row justify-content-center my-5">
                    <div className="col-lg-30">
                        <Countdown date={auction.dateatom} />
                    </div>
                </div>
                <div className="row justify-content-center my-5">
                    <div className="col-lg-30">
                        <button
                            onClick={e => {
                                e.preventDefault();
                                participate(auction.id);
                            }}
                            className="btn btn-danger w-100"
                        >
                            {__("Participate")}
                        </button>
                    </div>
                </div>
                <div className="row justify-content-center my-5">
                    <div className="col-lg-15">
                        <a href="/auctions" className="btn btn-default w-100">
                            {__("All auctions")}
                        </a>
                    </div>
                    <div className="col-lg-15">
                        <a href="/gallery" className="btn btn-default w-100">
                            {__("Online-gallery")}
                        </a>
                    </div>
                </div>
            </div>
        </div>
    );
}
