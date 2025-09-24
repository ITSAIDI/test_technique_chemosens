# 1.Data cleaning

- We first verify the existence of redundant entries in the data.
- Rows with missing values (no category) are eliminated.
- Scientific names, such as _Musa paradisiaca_ (bananas) or _Bos spp._ (beef), do not help our keyword-based approach and can introduce noise. Therefore, we remove them. These names are always added between parentheses as extra details in the data, so we use a regular expression to remove them.
- Special characters such as %, ?, etc., are cleaned, and all text is converted to lowercase.
- Stopwords are eliminated to facilitate keyword extraction and reduce noise in the data.
- Adjectives or verbs, are not relevant as keywords such as _aromatisée_, _semblables_, and _instantané_ to exclude them we keep only `NOUN` (Common noun) and `PROPN` (Proper noun). For this, we use a `POS` (Part-of-Speech) technique to detect them with a SpaCy model, [fr_dep_news_trf](https://github.com/explosion/spacy-models/releases/tag/fr_dep_news_trf-3.8.0), based on a transformer pipeline, which performs much better than other models in SpaCy for french.

-> The results of _Data cleaning_ stage are in _data/train_cleaned.xlsx_
