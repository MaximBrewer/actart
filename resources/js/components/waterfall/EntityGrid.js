import React from "react";
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
import __ from "../../utils/trans.js";

export default function EntityGrid(props) {
    const { items, columns, data, loading } = props;
    
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
        data.firstLimit = data.firstLimit ? data.firstLimit : data.limit;
        !!data.firstLimit || (data.firstLimit = 0);
        for (size in window.grid)
            if (window.innerWidth < window.grid[size]) break;
        let placeholders = [];
        for (let i = 0; i < data.firstLimit[size]; i++) {
            placeholders.push(<PlaceholderTizer key={i} />);
        }
        return placeholders;
    };
    return (
        <React.Fragment>
            {loading ? (
                <Masonry
                    breakpointCols={columns()}
                    className="my-masonry-grid"
                    columnClassName="my-masonry-grid_column"
                >
                    {getPlaceholders()}
                </Masonry>
            ) : !!items && items.length ? (
                <Masonry
                    breakpointCols={columns()}
                    className="my-masonry-grid"
                    columnClassName="my-masonry-grid_column"
                >
                    {items.map((item, index) => (
                        <Tizer {...props} item={item} key={index} />
                    ))}
                </Masonry>
            ) : (
                <h3 className="h3">{__("NOTHING_TO_SHOW")}</h3>
            )}
        </React.Fragment>
    );
}
