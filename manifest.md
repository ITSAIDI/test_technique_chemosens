# 1.Data cleaning

- We first verify the existence of redundant entries in the data.
- Rows with missing values (no category) are eliminated.
- Scientific names, such as _Musa paradisiaca_ (bananas) or _Bos spp._ (beef), do not help our keyword-based approach and can introduce noise. Therefore, we remove them. These names are always added between parentheses as extra details in the data, so we use a regular expression to remove them.
- Special characters such as %, ?, etc., are cleaned, and all text is converted to lowercase.
- Stopwords are eliminated to facilitate keyword extraction and reduce noise in the data.
- Adjectives or verbs, are not relevant as keywords such as _aromatisée_, _semblables_, and _instantané_ to exclude them we keep only `NOUN` (Common noun) and `PROPN` (Proper noun). For this, we use a `POS` (Part-of-Speech) technique to detect them with a SpaCy model, [fr_dep_news_trf](https://github.com/explosion/spacy-models/releases/tag/fr_dep_news_trf-3.8.0), based on a transformer pipeline, which performs much better than other models in SpaCy for french.
- The final cleaning step is to remove redundant words in product names or categories.

-> The results of _Data cleaning_ stage are in _data/train_cleaned.xlsx_ and _data/test_cleaned.xlsx_

# 2.Classification

## 2.1 Evaluation function

- Some products in the test data already appear in the training set, so we map their corresponding categories from the training data before starting the manual annotation of new products. Then we annoutate remained products.

## 2.2 Keywords based Pre-Selection

- The process works as follows: each product name is split into keywords. If a keyword appears in a category, this one is considered a candidate.
- Some products have rare names that do not appear in the categories keywords, so they end up with no candidates.
- If a product has only one candidate, there is no need for the refinement step, as the predicted category is already determined.

-> The results are in _data/train_with_candidates.xlsx_
