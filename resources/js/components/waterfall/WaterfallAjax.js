import React, { useState, useEffect } from "react";
import EntityGrid from "./EntityGrid";
import __ from "../../utils/trans";

export default function WaterfallAjax(props) {
    const { data, query, gallery } = props;
    data.firstLimit = data.firstLimit ? data.firstLimit : data.limit;

    const getPreviews = () => {
        return [];
    };

    const [state, setState] = useState({
        photos: getPreviews(),
        more: true,
        options: window.App.options,
        page: 0,
        loading: true,
        sortBy: "id",
        order: "asc",
        filter: {
            status: !!data.archive ? "gsold" : "available"
        }
    });

    const columns = () => {
        let size = "xs";
        for (size in window.grid)
            if (window.innerWidth < window.grid[size]) break;
        return data.view[size];
    };

    const getLimit = () => {
        let size = "xs";
        for (size in window.grid)
            if (window.innerWidth < window.grid[size]) break;
        return state.photos.length ? data.limit[size] : data.firstLimit[size];
    };

    const getOffset = () => {
        let size = "xs";
        for (size in window.grid)
            if (window.innerWidth < window.grid[size]) break;
        return state.page
            ? (state.page - 1) * data.limit[size] + data.firstLimit[size]
            : 0;
    };

    const addGallery = () => {
        let url =
            data.entity == "blog" || data.entity == "post"
                ? "/posts?entity=" + data.entity + "&"
                : "/" + data.entity + "?";
        data.category && (url += "category=" + data.category);
        query && (url += "query=" + query);
        data.author && (url += "author=" + data.author);
        data.lastbets && (url += "lastbets=1");
        if (data.entity == "lots") {
            url += "&status=" + state.filter.status;
            url += "&sortBy=" + state.sortBy;
            url += "&order=" + state.order;
        }
        if (!!data.exclude) {
            url += "&exclude=" + data.exclude;
        }
        url += "&limit=" + getLimit();
        url += "&offset=" + getOffset();
        axios
            .get("/api/" + window.App.locale + url)
            .then(res => {
                setState(prevState => {
                    return {
                        ...prevState,
                        photos: state.photos.concat(res.data.items),
                        page: state.page + 1,
                        loading: false,
                        more: res.data.next > 0
                    };
                });
            })
            .catch(err => {
                console.log(err);
            });
    };

    const getGallery = (filter, sortBy, order, options) => {
        let url =
            data.entity == "blog" || data.entity == "post"
                ? "/posts?entity=" + data.entity + "&"
                : "/" + data.entity + "?";
        query && (url += "query=" + query);
        data.category && (url += "category=" + data.category);
        data.author && (url += "author=" + data.author);
        data.lastbets && (url += "lastbets=1");
        if (data.entity == "lots") {
            url += "&status=" + filter.status;
            options.map(option => {
                !!filter[option.id] &&
                    (url += "&" + option.id + "=" + filter[option.id]);
            });
            url += "&sortBy=" + sortBy;
            url += "&order=" + order;
        }
        if (!!data.exclude) {
            url += "&exclude=" + data.exclude;
        }
        url += "&limit=" + getLimit();
        url += "&offset=" + 0;
        axios
            .get("/api/" + window.App.locale + url)
            .then(res => {
                setState(prevState => {
                    return {
                        ...prevState,
                        photos: res.data.items,
                        page: 1,
                        loading: false,
                        more: res.data.next > 0,
                        filter: filter,
                        sortBy: sortBy,
                        order: order
                    };
                });
            })
            .catch(err => {
                console.log(err);
            });
    };

    const createBet = event => {
        setState(prevState => {
            let items = [],
                update = false;
            for (let i in prevState.items) {
                let lot = prevState.items[i],
                    bets = lot.bets;
                if (lot.id == event.detail.bet.id) {
                    bets.unshift(event.detail.bet);
                    lot.price = event.detail.bet.bet;
                    update = true;
                }
                items.push(lot);
            }
            if (update)
                return {
                    ...prevState,
                    items: items
                };
            return prevState;
        });
    };

    const updateLotStatus = event => {
        setState(prevState => {
            let items = [],
                update = false;
            for (let i in prevState.items) {
                let lot = prevState.items[i];
                if (lot.id == event.detail.id) {
                    lot.status = event.detail.status;
                    update = true;
                }
                items.push(lot);
            }
            if (update)
                return {
                    ...prevState,
                    items: items
                };
            return prevState;
        });
    };

    const removeLot = event => {
        setState(prevState => {
            let lots = [];
            for (let item of prevState.items) {
                if (event.detail.id != item.id) lots.push(item);
            }
            return {
                ...prevState,
                items: lots
            };
        });
    };

    const setSortBy = (field, order) => {
        setState(prevState => {
            return {
                ...prevState,
                sortBy: field,
                order: order
            };
        });
        getGallery(state.filter, field, order, state.options);
    };

    useEffect(() => {
        window.addEventListener("remove-lot", removeLot);
        window.addEventListener("update-lot-status", updateLotStatus);
        window.addEventListener("create-bet", createBet);
        return () => {
            window.removeEventListener("remove-lot", removeLot);
            window.removeEventListener("update-lot-status", updateLotStatus);
            window.removeEventListener("create-bet", createBet);
        };
    }, []);

    useEffect(() => {
        getGallery(state.filter, state.sortBy, state.order, state.options);
    }, [query]);

    return (
        <div className="waterfall-outer row">
            <div className="col-60">
                {data.sortable && (
                    <div className="sorting">
                        <span>{__("Sort by")}: </span>
                        <a
                            href="#"
                            className={
                                state.sortBy == "author"
                                    ? state.order == "asc"
                                        ? `active asc`
                                        : `active desc`
                                    : ``
                            }
                            onClick={e => {
                                e.preventDefault();
                                setSortBy(
                                    "author",
                                    state.sortBy == "author" &&
                                        state.order == "asc"
                                        ? "desc"
                                        : "asc"
                                );
                            }}
                        >
                            <span>{__("#BYAUTHOR#")}</span>
                            <svg
                                viewBox="0 0 18 18"
                                xmlns="http://www.w3.org/2000/svg"
                            >
                                <path d="M9 18L0.339746 3L17.6603 3L9 18Z" />
                            </svg>
                        </a>
                        <a
                            href="#"
                            className={
                                state.sortBy == "title"
                                    ? state.order == "asc"
                                        ? `active asc`
                                        : `active desc`
                                    : ``
                            }
                            onClick={e => {
                                e.preventDefault();
                                setSortBy(
                                    "title",
                                    state.sortBy == "title" &&
                                        state.order == "asc"
                                        ? "desc"
                                        : "asc"
                                );
                            }}
                        >
                            <span>{__("#BYLOTNAME#")}</span>
                            <svg
                                viewBox="0 0 18 18"
                                xmlns="http://www.w3.org/2000/svg"
                            >
                                <path d="M9 18L0.339746 3L17.6603 3L9 18Z" />
                            </svg>
                        </a>
                        {/* {gallery ? '' : (
                            <React.Fragment>
                                <a
                                    href="#"
                                    className={
                                        state.sortBy == "price"
                                            ? state.order == "asc"
                                                ? `active asc`
                                                : `active desc`
                                            : ``
                                    }
                                    onClick={e => {
                                        e.preventDefault();
                                        setSortBy(
                                            "price",
                                            state.sortBy == "price" &&
                                                state.order == "asc"
                                                ? "desc"
                                                : "asc"
                                        );
                                    }}
                                >
                                    <span>{__("#BYPRICE#")}</span>
                                    <svg
                                        viewBox="0 0 18 18"
                                        xmlns="http://www.w3.org/2000/svg"
                                    >
                                        <path d="M9 18L0.339746 3L17.6603 3L9 18Z" />
                                    </svg>
                                </a>
                                <a
                                    href="#"
                                    className={
                                        state.sortBy == "sort"
                                            ? state.order == "asc"
                                                ? `active asc`
                                                : `active desc`
                                            : ``
                                    }
                                    onClick={e => {
                                        e.preventDefault();
                                        setSortBy(
                                            "sort",
                                            state.sortBy == "sort" &&
                                                state.order == "asc"
                                                ? "desc"
                                                : "asc"
                                        );
                                    }}
                                >
                                    <span>{__("SORT_BY_LOT_NUMBER")}</span>
                                    <svg
                                        viewBox="0 0 18 18"
                                        xmlns="http://www.w3.org/2000/svg"
                                    >
                                        <path d="M9 18L0.339746 3L17.6603 3L9 18Z" />
                                    </svg>
                                </a>
                            </React.Fragment>
                        )} */}
                    </div>
                )}
            </div>
            <div className={`col-60 stack-grid`}>
                <EntityGrid
                    columns={columns}
                    items={state.photos}
                    data={data}
                    loading={state.loading}
                    favorites={state.favorites}
                    {...props}
                />
                {state.more && data.action == "add" ? (
                    <div className="show-more">
                        <div className="dots">•••</div>
                        <a
                            href="#"
                            className="text"
                            onClick={e => {
                                e.preventDefault();
                                e.target.blur();
                                addGallery();
                            }}
                        >
                            {__("Show more")}
                        </a>
                    </div>
                ) : (
                        ""
                    )}
            </div>
        </div>
    );
}
