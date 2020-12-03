import React, { useState, useEffect } from "react";
import EntityGrid from "./EntityGrid";
import { Link, useLocation } from "react-router-dom";
import __ from "../../utils/trans";
// import { StickyContainer, Sticky } from 'react-sticky';
import Sticky from 'react-sticky-el';

export default function Waterfall(props) {
    const { pathname } = useLocation();
    const { data, items, category, status } = props;
    const [state, setState] = useState({
        items: [],
        more: true,
        options: window.App.options,
        page: 0,
        sortBy: "id",
        order: "asc",
        filter: {}
    });

    const columns = () => {
        let size = "xs";
        for (size in window.grid)
            if (window.innerWidth < window.grid[size]) break;
        return data.view[size];
    };

    const setSortBy = (field, order) => {
        setState(prevState => {
            return {
                ...prevState,
                items: prevState.items.sort(function (a, b) {
                    if (order == "asc") return a[field] > b[field] ? 1 : -1;
                    else return b[field] > a[field] ? 1 : -1;
                }),
                sortBy: field,
                order: order
            };
        });
    };
    const filterItems = (filter, prevState) => {
        let push = false,
            newItems = [];
        for (const item of items) {
            push = true;
            loop: for (const field in filter) {
                for (const option of item[field]) {
                    if (filter[field] == option.id) {
                        continue loop;
                    }
                }
                push = false;
            }
            push && newItems.push(item);
        }
        return {
            ...prevState,
            filter,
            items: newItems
        };
    };

    const delFilter = field => {
        setState(prevState => {
            let filter = prevState.filter;
            delete filter[field];
            return filterItems(filter, prevState);
        });
    };

    const setFilter = (field, value) => {
        setState(prevState => {
            let filter = prevState.filter;
            filter[field] = value;
            return filterItems(filter, prevState);
        });
    };

    useEffect(() => {
        if (!data.filterable) {
            if (!!status) {
                setState(prevState => {
                    let newItems = [];
                    for (const item of items) {
                        item.status == status && newItems.push(item);
                    }
                    return {
                        ...prevState,
                        items: newItems
                    };
                });
            } else {
                setState(prevState => {
                    return { ...prevState, items: items };
                });
            }
        }
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
        if (!!data.filterable) {
            if (!!category) setFilter("categories", category);
            else delFilter("categories");
        } else {
            if (!!status) {
                setState(prevState => {
                    let newItems = [];
                    for (const item of items) {
                        item.status == status && newItems.push(item);
                    }
                    return {
                        ...prevState,
                        items: newItems
                    };
                });
            } else {
                setState(prevState => {
                    return { ...prevState, items: items };
                });
            }
        }
    }, [pathname, items]);

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
                !!status
                    ? lot.status == status && items.push(lot)
                    : items.push(lot);
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

    return (
        <div className="waterfall-outer row">
            <div className="col-60">
                {data.sortable && (
                    <div className="sorting">
                        <span>{__("Sort by")}: </span>
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
                    </div>
                )}
            </div>
            {data.filterable && (
                <div className="waterfall-filterable col-60 col-md-15">
                    <Sticky boundaryElement=".waterfall-filterable" style = {{position: 'relative'}} topOffset={80}>
                        <ul>
                            {state.options.map((option, option_index) => (
                                <li key={option_index}>
                                    <span>{option.title}</span>
                                    <ul>
                                        {option.items.map((item, index) => (
                                            <li key={index}>
                                                {option.id == "categories" ? (
                                                    <Link
                                                        className={
                                                            category == item.id
                                                                ? `active`
                                                                : ``
                                                        }
                                                        to={
                                                            `/gallery/category/` +
                                                            item.id
                                                        }
                                                    >
                                                        {item.title}
                                                    </Link>
                                                ) : (
                                                        <a
                                                            className={
                                                                state.filter[
                                                                    option.id
                                                                ] == item.id
                                                                    ? `active`
                                                                    : ``
                                                            }
                                                            href="#"
                                                            onClick={e => {
                                                                e.preventDefault();
                                                                state.filter[
                                                                    option.id
                                                                ] == undefined ||
                                                                    state.filter[
                                                                    option.id
                                                                    ] != item.id
                                                                    ? setFilter(
                                                                        option.id,
                                                                        item.id
                                                                    )
                                                                    : delFilter(
                                                                        option.id
                                                                    );
                                                            }}
                                                        >
                                                            {item.title}
                                                        </a>
                                                    )}
                                            </li>
                                        ))}
                                        <li>
                                            {option.id == "categories" ? (
                                                <Link
                                                    className={
                                                        !category ? `active` : ``
                                                    }
                                                    to={`/gallery`}
                                                >
                                                    {__(`CATEGORY_ALL_LINK`)}
                                                </Link>
                                            ) : (
                                                    <a
                                                        className={
                                                            !state.filter[option.id]
                                                                ? `active`
                                                                : ``
                                                        }
                                                        href="#"
                                                        onClick={e => {
                                                            e.preventDefault();
                                                            delFilter(option.id);
                                                        }}
                                                    >
                                                        {__(`CATEGORY_ALL_LINK`)}
                                                    </a>
                                                )}
                                        </li>
                                    </ul>
                                </li>
                            ))}
                        </ul>
                    </Sticky>
                </div>
            )}
            <div
                className={
                    (data.filterable ? `col-60 col-md-45` : `col-60`) + ` stack-grid`
                }
            >
                <EntityGrid
                    {...props}
                    columns={columns}
                    items={state.items}
                    data={data}
                />
            </div>
        </div>
    );
}
