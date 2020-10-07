import React from "react";
import { Link } from 'react-router-dom';

export function Unstyled(props) {
    const getItems = () => {
        let items = [];
        Object.keys(props.items).forEach((index) => {
            items.push(<li className="text-nowrap" key={index}><Link to={props.items[index].url}>{props.items[index].title}</Link></li>)
        })
        return items;
    }
    return (<ul className="list-unstyled">{getItems()}</ul>);
}

export function Topmost(props) {
    const getItems = () => {
        let items = [];
        Object.keys(props.items).forEach((index) => {
            items.push(<li className="text-nowrap" key={index}><Link to={props.items[index].url}>{props.items[index].title}</Link></li>)
        })
        return items;
    }
    return (<ul className="list-unstyled d-flex m-0">{getItems()}</ul>);
}

export function Top(props) {
    const getItems = () => {
        let items = [];
        Object.keys(props.items).forEach((index) => {
            items.push(<li key={index} className={`text-nowrap list-group-item` + (index == 0 ? ` list-group-item-header` : ``)}><Link to={props.items[index].url}>{props.items[index].title}</Link></li>)
        })
        return items;
    }
    return (<ul className="list-group list-group-flush">
        {getItems()}
    </ul>
    );
}