import React, { useState, useEffect } from "react";
import EntityGrid from "./EntityGrid";
import { Link, useLocation } from "react-router-dom";
import __ from '../../utils/trans';

export default function Waterfall(props) {
    const { pathname } = useLocation();
    const { data, items, toFavorite, favorites, category } = props;
    const [state, setState] = useState({
        items: [],
        more: true,
        options: [],
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

    const updateLot = event => {
        setState(prevState => {
            let items = [];
            for (let i in prevState.items) {
                if (event.detail.lot.id == prevState.items[i].id) {
                    items.push(event.detail.lot);
                } else {
                    items.push(prevState.items[i]);
                }
            }
            return {
                ...prevState,
                items
            };
        });
    };

    const setSortBy = (field, order) => {
        setState(prevState => {
            return {
                ...prevState,
                items: prevState.items.sort(function(a, b) {
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
            let filter = prevState.filter,
                itemsNew = [],
                push;
            filter[field] = value;
            return filterItems(filter, prevState);
        });
    };

    useEffect(() => {
        window.addEventListener("lot", updateLot);
        if (!data.filterable) {
            setState(prevState => {
                return { ...prevState, items: items };
            });
        } else {
            axios
                .get("/api/" + window.lang + "/lots/options")
                .then(res => {
                    setState(prevState => {
                        return { ...prevState, options: res.data };
                    });
                })
                .catch(err => {
                    console.log(err);
                });
        }
    }, []);

    useEffect(() => {
        if (!!data.filterable)
            if (!!category) setFilter("categories", category);
            else delFilter("categories");
        else
            setState(prevState => {
                return { ...prevState, items: items };
            });
    }, [pathname, items]);

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
                <div className="waterfall-filterable col-15">
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
                                    {option.id == "categories" ? (
                                        <li>
                                            <Link
                                                className={
                                                    !category ? `active` : ``
                                                }
                                                to={`/gallery`}
                                            >
                                                {__(`CATEGORY_ALL_LINK`)}
                                            </Link>
                                        </li>
                                    ) : (
                                        ``
                                    )}
                                </ul>
                            </li>
                        ))}
                    </ul>
                </div>
            )}
            <div
                className={
                    `col-` + (data.filterable ? `45` : `60`) + ` stack-grid`
                }
            >
                <EntityGrid
                    columns={columns}
                    items={state.items}
                    toFavorite={toFavorite}
                    data={data}
                    favorites={favorites}
                />
            </div>
        </div>
    );
}
