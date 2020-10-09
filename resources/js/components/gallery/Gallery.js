import React, { useState, useEffect } from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import GalleryLot from "./Lot";
import GalleryArchive from "./Archive";
import GalleryCategory from "./Category";
import __ from '../../utils/trans';

export default function Gallery() {
    const [state, setState] = useState({
        items: [],
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
    useEffect(() => {
        axios
            .get("/api/" + window.lang + "/lots?&status=gallery")
            .then(res => {
                setState(prevState => {
                    return {
                        ...prevState,
                        items: res.data.items
                    };
                });
            })
            .catch(err => {
                console.log(err);
            });
    }, []);
    return (
        <Router>
            <Switch>
                <Route exact path={`/gallery`}>
                    <GalleryCategory
                        items={state.items}
                        showLink={false}
                        setState={setState}
                    />
                </Route>
                <Route exact path={`/gallery/lot/:id`}>
                    <GalleryLot
                        items={state.items}
                        setState={setState}
                        showLink={true}
                        toFavorite={toFavorite}
                        favorites={state.favorites}
                    />
                </Route>
                <Route path={`/gallery/category/:id`}>
                    <GalleryCategory
                        items={state.items}
                        setState={setState}
                        showLink={true}
                        toFavorite={toFavorite}
                        favorites={state.favorites}
                    />
                </Route>
                <Route exact path={`/gallery/archive`}>
                    <GalleryArchive
                        items={state.items}
                        setState={setState}
                        showLink={true}
                        toFavorite={toFavorite}
                        favorites={state.favorites}
                    />
                </Route>
            </Switch>
        </Router>
    );
}
