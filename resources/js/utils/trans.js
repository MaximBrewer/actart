export default function __(key, replace) {
    let translation,
        translationNotFound = true;

    try {
        translation = key
            .split(".")
            .reduce((t, i) => t[i] || null, window.App.translations);
        if (translation) {
            translationNotFound = false;
        }
    } catch (e) {
        translation = key;
    }

    if (translationNotFound) {
        translation = window.App.translations.json[key]
            ? window.App.translations.json[key]
            : key;
    }
    if (typeof replace == "object")
        for (let key in replace) {
            translation = translation.replace(":" + key, replace[key]);
        }
    return translation;
};
