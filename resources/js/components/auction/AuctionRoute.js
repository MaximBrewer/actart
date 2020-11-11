import React, { useState, useEffect } from "react";
import {
    BrowserRouter as Router,
    Route,
    Switch,
    useParams,
    useRouteMatch
} from "react-router-dom";

import AuctionLot from "./AuctionLot";
import AuctionBase from "./AuctionBase";

export default function AuctionRoute(props) {
    console.log("route");
    return (
        <Switch>
            <Route exact path={path}>
                <AuctionBase {...props} auction={state.auction} />
            </Route>
            <Route path={`${path}/lot/:lotId`}>
                <AuctionLot {...props} auction={state.auction} />
            </Route>
        </Switch>
    );
}
