import React from "react";
import __ from '../../../utils/trans';
import Countdown from "../Countdown";
import { Link } from "react-router-dom";

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
                        <Link
                            to={"/auctions/" + auction.id}
                            className="btn btn-danger w-100"
                            onClick={e => participate(e, auction.id)}
                        >
                            {__("Participate")}
                        </Link>
                    </div>
                </div>
                <div className="row justify-content-center my-5">
                    <div className="col-lg-15">
                        <Link to="/auctions" className="btn btn-default w-100">
                            {__("All auctions")}
                        </Link>
                    </div>
                    <div className="col-lg-15">
                        <Link to="/gallery" className="btn btn-default w-100">
                            {__("Online-gallery")}
                        </Link>
                    </div>
                </div>
            </div>
        </div>
    );
}
