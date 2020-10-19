import React, { useState, useEffect, useRef } from "react";
import { NavLink, Link, useHistory } from 'react-router-dom';
import __ from '../utils/trans';
import {
    Lens,
    Close,
} from '../icons/header'

export default function Search(props) {
    let history = useHistory();
    const { hidden, closeSearch } = props;
    const [state, setState] = useState({
        query: ''
    });
    const inputEl = useRef(null);
    const closeBtn = useRef(null);
    const handleSubmit = e => {
        e.preventDefault();
        history.push('/search/' + state.query);
    }
    const handleChange = e => {
        setState(prevState => ({
            ...prevState,
            query: inputEl.current.value
        }))
    }
    useEffect(() => {
        hidden && inputEl.current.focus()
    }, []);
    return (
        <div className={`search-form` + (hidden ? ` form-search-full d-flex justify-content-end` : ``)}>
            <form action="#" onSubmit={handleSubmit}>
                <div className="search-container">
                    <input type="text" placeholder={__('Search..')} ref={inputEl} onChange={handleChange} name="search" className="form-control" />
                    <div className="btn-container">
                        <button type="submit" className="btn p-1 btn-link">
                            <Lens />
                        </button>
                        <button type="button" ref={closeBtn} onClick={closeSearch}
                            className="btn p-1 btn-link close-search-form">
                            <Close />
                        </button>
                    </div>
                    <div className={`result-container`}>

                    </div>
                </div>
            </form>
        </div>
    );
}
