import React from "react";
export default function Bottom(props) {
    const { auction, participate } = props;
    return (
        <div className="auction-footer">
            <div className="container">
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
                <div className="row justify-content-center my-5">
                    <div className="col-lg-15">
                        <a href="/auctions" className="btn btn-link">
                            {__("Archive of auctions")}
                        </a>
                    </div>
                </div>
            </div>
        </div>
    );
}
