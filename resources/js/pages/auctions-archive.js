import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import __ from '../utils/trans';
import useDocumentTitle from '../components/document-title';
import client from '../api/client';
import AuctionPreviewLeft from "../components/auction/archive/blocks/AuctionPreviewLeft.js";
import AuctionPreviewRight from "../components/auction/archive/blocks/AuctionPreviewRight";

export default function AuctionsArchive(props) {
    
    useDocumentTitle(__('ARCHIVE_OF_AUCTIONS_PAGE_TITLE'));

    const [state, setState] = useState({
        auctions: []
    });

    const getAuctions = (url) => {
        return client(url)
            .then(({ auctions }) =>
                setState((prevState) => {
                    return {
                        ...prevState,
                        auctions
                    }
                })
            )
            .catch(() => null);
    }

    useEffect(() => {
        let url = '/api/' + window.App.locale + '/auctions?status=finished';
        getAuctions(url)
    }, []);

    return (
        <React.Fragment>
            <div className="sticky-wrapper">
                <section className="auctions-section archive-list">
                    <div className="container">
                        <div className="row announce mb-xl-5">
                            <div className="col col-xl-40 col-xxl-38">
                                <h2 className="h1">{__('ARCHIVE_OF_AUCTIONS_TITLE')}</h2>
                            </div>
                        </div>
                        <div className="act-auctions-list" data-attr="special">
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
                        </div>
                    </div>
                </section>
                <div className="sticky-section mt-5"><span>{__('ARCHIVE_OF_AUCTIONS')}</span></div>
            </div>
            <section className="auctions-section">
                <div className="container">
                    <div className="row announce">
                        <div className="col col-xl-40 col-xxl-38">
                        </div>
                        <div className="col col-xl-20 col-xxl-22 text-center">
                            <Link to="/auctions" className="btn btn-default">{__('ARCHIVE_LINK_TO_AUCTIONS')}</Link>
                        </div>
                    </div>
                </div>
            </section>
        </React.Fragment>
    );
}
