let { useEffect } = require('react');

function useDocumentTitle (title, description = null, keywords = null) {
  useEffect(() => {
    console.log(window.App.meta_description)
    console.log(window.App.meta_keywords)
    console.log(window.App.meta_title)
    document.title = title ? title : window.App.meta_title;
    document.querySelector('meta[name="description"]').setAttribute("content", description ?? window.App.meta_description);
    document.querySelector('meta[name="keywords"]').setAttribute("content", keywords ?? window.App.meta_keywords);
  }, [title]);
}

export default useDocumentTitle;
