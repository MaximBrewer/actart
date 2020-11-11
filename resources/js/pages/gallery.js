import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';

import GalleryLot from "../components/gallery/Lot";
import GalleryArchive from "../components/gallery/Archive";
import GalleryCategory from "../components/gallery/Category";

export default function Gallery(props) {
    console.log("gallery")
    return (
        <Switch>
            <Route exact path={`/gallery`}><GalleryCategory {...props} showLink={false} /></Route>
            <Route exact path={`/gallery/category/:id`}><GalleryCategory {...props} showLink={true} /></Route>
            <Route exact path={`/gallery/lot/:id`}><GalleryLot {...props} showLink={true} /></Route>
            <Route exact path={`/gallery/archive`}><GalleryArchive {...props} showLink={true} /></Route>
        </Switch>
    );
};
