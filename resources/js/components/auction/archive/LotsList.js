import React, { useState, useEffect } from "react";
import Waterfall from "../../waterfall/Waterfall";
import { useParams } from "react-router-dom";
import __ from '../../../utils/trans';

export default function ArchiveLotsList(props) {

    const { id, lotId } = useParams();
    const { auction, lot } = props;
    const [state, setState] = useState({
        items: auction.lots,
        data: {
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
        }
    });

    useEffect(() => {
            console.log(lotId)
        lotId && (setState(prevState => {
            let items = [];
            for (let item of prevState.items) item.id != lotId && items.push(item);
            return { ...prevState, items}
        }))
    }, [id, lotId]);

    return (
        <div className="container">
            <div className="h3">{!!lot ? __("IN_THE_AUCTION") : __("IN_THE_SAME_AUCTION")}</div>
            <Waterfall
                {...props}
                items={state.items}
                data={state.data}
            />
        </div>
    );
}
