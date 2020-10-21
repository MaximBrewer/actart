import React, { useState, useEffect } from "react";
import Right from "../carousel/Right";
import __ from '../../../utils/trans';
import Parser from "html-react-parser";

export default function Center(props) {

    const [state, setState] = useState({
        auction: props.auction,
        finished: false,
        translation: window.App.translation
    });

    const updateAuction = event => {
        setState(prevState => prevState.auction.status == event.detail.auction.status ? prevState : {
            ...prevState,
            auction: event.detail.auction
        });
    };

    const updateTranslation = event => {
        setState(prevState => ({
            ...prevState,
            translation: event.detail.translation
        }));
    };

    useEffect(() => {
        window.addEventListener("update-translation", updateTranslation);
        window.addEventListener("auction", updateAuction);
        return () => {
            window.removeEventListener("auction", updateAuction)
            window.removeEventListener("update-translation", updateTranslation)
        }
    }, []);

    useEffect(() => {
        if (state.auction && state.auction.lots) {
            let finished = true;
            for (const lot of state.auction.lots) {
                if (lot.status == 'auction' || lot.status == 'in_auction') finished = false;
            }
            setState(prevState => ({
                ...prevState,
                finished: finished
            }))
        }
    }, [state.auction]);

    return <div className="auction-info">
        <div className="container">
            <div className="lot-carousel">
                <div className="row">
                    <div className="col-xl-40 col-xxl-38">
                        <div className="left-side">
                            <div>
                                <div style={{ paddingTop: "56.25%", height: 0, position: "relative" }} className={`translation-wrapper`} >
                                    {Parser(state.translation)}
                                </div>
                                <div className={`current`} >
                                    {state.auction.current ? (
                                        <div>{state.auction.current.title}</div>
                                    ) : ``}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div className="col-xl-20 col-xxl-22">
                        <div className="right-side">
                            {state.auction.current ?
                                <Right item={state.auction.current} {...props} />
                                :
                                <h3 className={`py-5 text-center color-red`}>{!state.finished ? __('AUCTION_WILL_START_SOON') : __('AUCTION_HAS_FINISHED')}</h3>
                            }
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>;
}
