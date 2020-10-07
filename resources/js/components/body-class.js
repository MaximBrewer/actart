let { useEffect } = require('react');

function useBodyClass (className) {
  useEffect(() => {
    document.body.className = className;
  }, [className]);
}

export default useBodyClass;