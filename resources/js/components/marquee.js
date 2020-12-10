import React from 'react';
import { useAuth } from '../context/auth';
import __ from '../utils/trans';
import Parser from "html-react-parser";

export default function Marquee() {
    let { currentUser } = useAuth();

    const getString = () => {
        let srt = [];
        for (let i = 0; i < 15; i++) {
            srt.push(<span key={i} className="sub_h1" style={{ animation: `moveX_-100 ${window.App.ticker.ts}s linear infinite` }}>{window.App.ticker.text}&nbsp;</span>)
        }
        return srt;
    }

    const getString2 = () => {
        let srt = [];
        for (let i = 0; i < 15; i++) {
            srt.push(
                <span key={i} style={{ animation: `moveX_-100 ${window.App.ticker.ps}s linear infinite` }}>
                    <img src={window.App.ticker.picture} alt="" />&nbsp;
                </span>
            )
        }
        return srt;
    }


    return (
        <section className="bk-main-awards-ticker bg-black white overflow-hidden relative d-none d-lg-block" style={{ color: window.App.ticker.color, backgroundColor: window.App.ticker.bg }}>
            <div className="bk-main-ticker-line-1 flex">{getString()}</div>
            <div className="bk-main-ticker-line-2 flex">{getString2()}</div>
        </section>
    );
}
