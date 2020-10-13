import React, { useEffect } from "react";
import Masonry from "react-masonry-css";
import AuctionTizer from "./tizers/Auction.js";
import GalleryTizer from "./tizers/Gallery.js";
import NewsTizer from "./tizers/News.js";
import BlogTizer from "./tizers/Blog.js";
import AuthorTizer from "./tizers/Author.js";
import EventTizer from "./tizers/Event.js";
import LastbetsTizer from "./tizers/Lastbets.js";
import LotPlaceholderTizer from "./tizers/placeholders/Lot.js";
import DefaultPlaceholderTizer from "./tizers/placeholders/Default.js";

export default function EntityGrid(props) {
    const { items, columns, data } = props;

    const Tizer = props => {
        switch (data.tizerView) {
            case "auction":
                return <AuctionTizer {...props} />;
            case "gallery":
                return <GalleryTizer {...props} />;
            case "news":
                return <NewsTizer {...props} />;
            case "blog":
                return <BlogTizer {...props} />;
            case "event":
                return <EventTizer {...props} />;
            case "author":
                return <AuthorTizer {...props} />;
            case "lastbets":
                return <LastbetsTizer {...props} />;
            default:
                return <AuctionTizer {...props} />;
        }
    };
    const PlaceholderTizer = props => {
        switch (data.tizerView) {
            case "auction":
            case "gallery":
            case "lastbets":
                return <LotPlaceholderTizer {...props} />;
            case "news":
            case "blog":
            case "event":
            case "author":
            default:
                return <DefaultPlaceholderTizer {...props} />;
        }
    };
    const getPlaceholders = () => {
        let size = "xs";
        for (size in window.grid) if (window.innerWidth < window.grid[size]) break;
        let placeholders = [];
        for (let i = 0; i < data.firstLimit[size]; i++) {
            placeholders.push(<PlaceholderTizer key={i} />)
        }
        console.log(data.firstLimit[size]);
        return placeholders;
    }
    return (
        <Masonry
            breakpointCols={columns()}
            className="my-masonry-grid"
            columnClassName="my-masonry-grid_column"
        >
            {
                items != undefined && items.length ? items.map((item, index) => (
                    <Tizer item={item} key={index} {...props} />
                )) : getPlaceholders()
            }
        </Masonry>
    );
}
