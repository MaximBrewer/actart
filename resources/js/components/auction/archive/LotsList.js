import React from "react";
import Waterfall from "../../waterfall/Waterfall";
import __ from '../../../utils/trans';

export default function ArchiveLotsList(props) {
    const { auction } = props;
    return (
        <div className="container">
            <div className="h3">{__("IN_THE_SAME_AUCTION")}</div>
            <Waterfall
                {...props}
                items={auction.lots}
                data={{
                    auction: auction,
                    entity: "lots",
                    sortable: true,
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
