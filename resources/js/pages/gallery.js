import React, { useState, useEffect } from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";

import GalleryLot from "../components/gallery/Lot";
import GalleryArchive from "../components/gallery/Archive";
import GalleryCategory from "../components/gallery/Category";
import GalleryLotArchive from "../components/gallery/LotArchive";

export default function Gallery(props) {
    const [state, setState] = useState({
        items: window.App.gallery
    });

    const updateLotStatus = event => {
        setState(prevState => {
            let items = [];
            for (let item of prevState.items) {
                if (
                    event.detail.id != item.id ||
                    event.detail.status == "gallery"
                ) {
                    items.push(item);
                }
            }
            return { ...prevState, items: items };
        });
    };

    const createBet = event => {
        // setState(prevState => {
        //     let item = { ...prevState.item },
        //         update = false;
        //     if (item.id == event.detail.bet.lot_id) {
        //         item.bets.unshift(event.detail.bet);
        //         item.price = event.detail.bet.bet;
        //         update = true;
        //     }
        //     if (update)
        //         return {
        //             ...prevState,
        //             item: item
        //         };
        //     return prevState;
        // });
    };

    useEffect(() => {
        window.addEventListener("update-lot-status", updateLotStatus);
        window.addEventListener("create-bet", createBet);
        return () => {
            window.removeEventListener("update-lot-status", updateLotStatus);
            window.removeEventListener("create-bet", createBet);
        };
    }, []);

    return (
        <Switch>
            <Route exact path={`/gallery`}>
                <GalleryCategory
                    {...props}
                    showLink={false}
                    items={state.items}
                />
            </Route>
            <Route exact path={`/gallery/category/:id`}>
                <GalleryCategory
                    {...props}
                    showLink={true}
                    items={state.items}
                />
            </Route>
            <Route exact path={`/gallery/lot/:id`}>
                <GalleryLot {...props} showLink={true} items={state.items} />
            </Route>
            <Route exact path={`/gallery/archive`}>
                <GalleryArchive {...props} showLink={true} />
            </Route>
            <Route exact path={`/gallery/archive/lot/:id`}>
                <GalleryLotArchive {...props} showLink={true} />
            </Route>
        </Switch>
    );
}
