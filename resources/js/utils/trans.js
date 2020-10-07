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
    if (typeof replace == "array")
        [].forEach.call(replace, (value, key) => {
            translation = translation.replace(":" + key, value);
        });

    return translation;
};
