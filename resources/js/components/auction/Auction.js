import React, { useState, useEffect, useRef } from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import { Link, useParams, useLocation } from "react-router-dom";
import AuctionBase from "./AuctionBase";
import AuctionLot from "./AuctionLot";
import __ from '../../utils/trans';

export default function Auction(props) {

    const { id } = useParams();
    const [state, setState] = useState({
        auction: null,
        favorites: window.user != undefined ? window.user.favorites : null
    });

    const toFavorite = (id, e) => {
        e.preventDefault();
        if (window.user == undefined) {
            window.dispatchEvent(
                new CustomEvent("flash", {
                    detail: {
                        message: __(
                            "To add to favorites, authorization is required"
                        ),
                        type: "error"
                    }
                })
            );
            return false;
        }

        let favorites = user.favorites;
        let action = user.favorites.indexOf(id) < 0 ? "add" : "remove";
        let url = "/user/favorites/" + action + "/" + id;

        axios
            .patch(url)
            .then(res => {
                user = res.data.user;
                favorites = user.favorites;
                window.dispatchEvent(
                    new CustomEvent("flash", {
                        detail: {
                            message:
                                action == "add"
                                    ? __("Added to favorites")
                                    : __("Removed from favorites"),
                            type: action == "add" ? "success" : "error"
                        }
                    })
                );
                setState(prevState => {
                    return { ...prevState, favorites };
                });
            })
            .catch(err => {
                console.log(err);
            });
    };

    const updateAuction = event => {
        setState(prevState => {
            return {
                ...prevState,
                auction: event.detail.auction
            };
        });
    };

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
        window.addEventListener("auction", updateAuction);
    }, []);

    return (
        <Router>
            <Switch>
                <Route exact path={`/auctions/` + id}>
                    <AuctionBase
                        setState={setState}
                        toFavorite={toFavorite}
                        favorites={state.favorites}
                        auction={state.auction}
                        participate={props.participate}
                    />
                </Route>
                <Route exact path={`/auctions/` + id + `/lot/:id`}>
                    <AuctionLot
                        setState={setState}
                        toFavorite={toFavorite}
                        favorites={state.favorites}
                        auction={state.auction}
                        participate={props.participate}
                    />
                </Route>
            </Switch>
        </Router>
    );
}
