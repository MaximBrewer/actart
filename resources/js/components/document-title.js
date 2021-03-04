let { useEffect } = require('react');

function useDocumentTitle (title, description = null, keywords = null) {
  useEffect(() => {
    document.title = title ? title : window.App.meta_title;
    document.querySelector('meta[name="description"]').setAttribute("content", description ? description : window.App.meta_description);
    document.querySelector('meta[name="keywords"]').setAttribute("content", keywords ? keywords : window.App.meta_keywords);
  }, [title]);
}

export default useDocumentTitle;
