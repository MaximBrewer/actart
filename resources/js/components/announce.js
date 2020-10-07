import React from 'react';
import { useAuth } from '../context/auth';
import __ from '../utils/trans';
import Parser from "html-react-parser";

export default function Marquee() {
    let { currentUser } = useAuth();
    return (

        <section className="auction-announce"
            style={{ backgroundImage: `url(` + window.App.announce.narrow + `)`, backgroundPosition: `top center` }}>
            <div className="darkener">
                <div className="container">
                    <div className="h1">{Parser(window.App.announce.announce_text)}</div>
                    <div className="h3">{window.App.announce.dateout} &nbsp;&nbsp;&nbsp; <a href={`/auctions/` + window.App.announce.id} className="btn btn-default-inverse">{__('подробнее')}</a></div>
                </div>
            </div>
        </section>
    );
}
