export default function __(key, replace) {
    let translation,
        translationNotFound = true;

    try {
        translation = key
            .split(".")
            .reduce((t, i) => t[i] || null, window.App.translations);
        if (translation)
            translationNotFound = false;

    } catch (e) {
        translation = key;
    }

    if (translationNotFound) {
        translation = window.App.translations.json[key];
        if (translation)
            translationNotFound = false;
    }

    if (translationNotFound) {
        translation = window.App.translations.db[key];
        if (translation)
            translationNotFound = false;
    }

    if (translationNotFound) { translation = key }

    if (typeof replace == "object")
        for (let key in replace) {
            translation = translation.replace(":" + key, replace[key]);
        }
    return translation;
};
