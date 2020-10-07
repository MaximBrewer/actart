import React from "react";
import Masonry from "react-masonry-css";
import AuctionTizer from "./tizers/Auction.js";
import GalleryTizer from "./tizers/Gallery.js";
import NewsTizer from "./tizers/News.js";
import BlogTizer from "./tizers/Blog.js";
import AuthorTizer from "./tizers/Author.js";
import EventTizer from "./tizers/Event.js";
import LastbetsTizer from "./tizers/Lastbets.js";

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
    return (
        <Masonry
            breakpointCols={columns()}
            className="my-masonry-grid"
            columnClassName="my-masonry-grid_column"
        >
            {items != undefined
                ? items.map((item, index) => (
                      <Tizer item={item} key={index} {...props} />
                  ))
                : ``}
        </Masonry>
    );
}
