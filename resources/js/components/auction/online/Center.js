import React from "react";
import Left from "../carousel/Left";
import Right from "../carousel/Right";
import __ from '../../../utils/trans';

export default function Center(props) {
    const { auction } = props;
    return <div className="auction-info">
        <div className="container">
            <div className="lot-carousel">
                {auction.current ?
                    <div className="row">
                        <div className="col-xl-40 col-xxl-38">
                            <div className="left-side">
                                <Left item={auction.current} {...props} />
                            </div>
                        </div>
                        <div className="col-xl-20 col-xxl-22">
                            <div className="right-side">
                                <Right item={auction.current} {...props} />
                            </div>
                        </div>
                    </div>
                    : ``}
            </div>
        </div>
    </div>;
}
