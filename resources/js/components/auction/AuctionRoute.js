import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';

import AuctionLot from "./AuctionLot";
import AuctionBase from "./AuctionBase";

export default function AuctionRoute(props) {
    return (
        <Switch>
            <Route exact path={`/auctions/:id/lot/:lotId`}><AuctionLot {...props}/></Route>
            <Route exact path={`/auctions/:id`}><AuctionBase {...props}/></Route>
        </Switch>
    );
};
