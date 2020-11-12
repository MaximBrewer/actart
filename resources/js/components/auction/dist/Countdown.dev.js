"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = CountdownI;

var _react = _interopRequireDefault(require("react"));

var _trans = _interopRequireDefault(require("../../utils/trans"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

// import CountdownMaster, {
//     zeroPad
// } from "react-countdown";
function CountdownI() {
  return "";
} // function Countdown(props) {
//     const declOfNum = (number, titles) => {
//         let cases = [2, 0, 1, 1, 1, 2];
//         return titles[
//             number % 100 > 4 && number % 100 < 20
//                 ? 2
//                 : cases[number % 10 < 5 ? number % 10 : 5]
//         ];
//     };
//     const Completionist = () => (
//         <div className="banner-counter d-flex h3 h3 color-red">{__('COUNTDOWN_AUCTION_STARTED')}</div>
//     );
//     const renderer = ({ days, hours, minutes, seconds, completed }) => {
//         if (window.innerWidth < window.grid.sm) return "";
//         if (completed) {
//             return <Completionist />;
//         } else {
//             return (
//                 <div className="banner-counter-wrapper">
//                     <p>{__("to start auction")}</p>
//                     <div className="banner-counter d-flex">
//                         <div className="days">
//                             <div className="number h5">{zeroPad(days)}</div>
//                             <small>
//                                 {declOfNum(days, [
//                                     __("день"),
//                                     __("дня"),
//                                     __("дней")
//                                 ])}
//                             </small>
//                         </div>
//                         <div className="separator h5"></div>
//                         <div className="ours">
//                             <div className="number h5">{zeroPad(hours)}</div>
//                             <small>
//                                 {declOfNum(hours, [
//                                     __("час"),
//                                     __("часа"),
//                                     __("часов")
//                                 ])}
//                             </small>
//                         </div>
//                         <div className="separator h5">:</div>
//                         <div className="minutes">
//                             <div className="number h5">{zeroPad(minutes)}</div>
//                             <small>
//                                 {declOfNum(minutes, [
//                                     __("мин."),
//                                     __("мин."),
//                                     __("мин.")
//                                 ])}
//                             </small>
//                         </div>
//                         <div className="separator h5">:</div>
//                         <div className="seconds">
//                             <div className="number h5">{zeroPad(seconds)}</div>
//                             <small>
//                                 {declOfNum(seconds, [
//                                     __("сек."),
//                                     __("сек."),
//                                     __("сек.")
//                                 ])}
//                             </small>
//                         </div>
//                     </div>
//                 </div>
//             );
//         }
//     };
//     const data = { props };
//     return <CountdownMaster date={props.date} renderer={renderer} />;
// }