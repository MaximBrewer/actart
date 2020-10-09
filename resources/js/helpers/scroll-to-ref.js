export default function scrollToElement(ref) {
    let elem = ref.current;
    if (!elem) return false;
    let toY =
        (elem.getBoundingClientRect().top +
            document.scrollingElement.scrollTop) *
        1 -
        68,
        fromY = document.scrollingElement.scrollTop * 1,
        scrollY = fromY * 1,
        oldTimestamp = null;
    function step(newTimestamp) {
        if (oldTimestamp !== null) {
            if (fromY < toY) {
                scrollY += 100;
                if (scrollY >= toY) {
                    document.scrollingElement.scrollTop = toY;
                    return false;
                }
                document.scrollingElement.scrollTop = scrollY;
            } else {
                scrollY -= 100;
                document.scrollingElement.scrollTop = scrollY;
                if (scrollY <= toY) {
                    document.scrollingElement.scrollTop = toY;
                    return false;
                }
            }
        }
        oldTimestamp = newTimestamp;
        window.requestAnimationFrame(step);
    }
    window.requestAnimationFrame(step);
    return false;
};