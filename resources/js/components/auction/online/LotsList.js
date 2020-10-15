import React from "react";
import __ from '../../../utils/trans';
import Waterfall from "../../waterfall/Waterfall";
export default function LotsList(props) {
    const { auction } = props;
    return (
        <div className="container">
            <div className="h3">{__("FUTHER_IN_THE_AUCTION")}</div>
            <Waterfall
                {...props}
                items={auction.lots}
                status={'auction'}
                data={{
                    auction: auction,
                    entity: "lots",
                    tizerView: "auction",
                    view: {
                        xs: 1,
                        sm: 2,
                        md: 2,
                        lg: 4,
                        xl: 4,
                        xxl: 4
                    }
                }}
            />
        </div>
    );
}
