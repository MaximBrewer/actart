import React from 'react';
import __ from '../utils/trans';
import Parser from "html-react-parser";
import { Link } from "react-router-dom";

export default function Announce() {
    return (
        <section className="auction-announce"
            style={{ backgroundImage: `url(` + window.App.announce.narrow + `)`, backgroundPosition: `top center` }}>
            <div className="darkener">
                <div className="container">
                    <div className="h1">{Parser(window.App.announce.announce_text)}</div>
                    <div className="h3">{window.App.announce.dateout} &nbsp;&nbsp;&nbsp; <Link to={`/auctions/` + window.App.announce.id} className="btn btn-default-inverse">{__('подробнее')}</Link></div>
                </div>
            </div>
        </section>
    );
}
