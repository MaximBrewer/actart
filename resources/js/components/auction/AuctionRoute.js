import React from "react";
import { BrowserRouter as Router, Route, Switch, useParams } from "react-router-dom";
import AuctionLot from "./AuctionLot";
import AuctionBase from "./AuctionBase";

export default function AuctionRoute(props) {

    const { id } = useParams();

    const [state, setState] = useState({
        auction: null
    });

    useEffect(() => {
        axios
            .get("/api/" + window.App.locale + "/auctions/" + id)
            .then(res => {
                setState({
                    auction: res.data.auction
                });
            })
            .catch(err => {
                console.log(err);
            });
        window.addEventListener("update-auction-status", updateAuctionStatus);
        return () => {
            window.removeEventListener(
                "update-auction-status",
                updateAuctionStatus
            );
        };
    }, []);

    const updateAuctionStatus = event => {
        setState(prevState => {
            if (event.detail.id == prevState.auction.id)
                return {
                    ...prevState,
                    auction: {
                        ...prevState.auction,
                        status: event.detail.status
                    }
                };
            else return prevState;
        });
    };

    return (
        <Switch>
            <Route exact path={`/auctions/:id`}>
                <AuctionBase {...props} auction={state.auction} />
            </Route>
            <Route exact path={`/auctions/:id/lot/:lotId`}>
                <AuctionLot {...props} auction={state.auction} />
            </Route>
        </Switch>
    );
}
