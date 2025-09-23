# 1.Data cleaning notes

- Removing stopwords like (de, à, au...) from product names can reduce clarity. For example, "jus de pomme bio" → "jus pomme bio," which is less meaningful, so I choose not to perform this. For the category column, it is not necessary because another treatment is planned.

## 1.3 Working on Categories

Issues with `Catégorie de référence`: (examples are from `data/train.xlsx`)

- Very long and detailed categories
  Examples :
  _pizzas et tartes semblables à des pizzas viandes et légumes_
  _boissons au cola caféiniques faibles en calories_ ...

- Mixed content types in some categories (common names + scientific names) witch make it unclear. <br>
  Examples :<br>
  _tomates lycopersicum esculentum_,<br>
  _brocoli brassica oleracea var italica_ ...

- Different wording but same meaning, in other words, some categories mean essentially the same thing but are written differently, this create unnecessary categories.
  Examples :
  _yaourt, lait de vache, aux fruits_ vs _yaourt aux myrtilles_ -> both are **yogurt**
  _avocat prêt à consommer_ vs _avocats persea americana_ -> both are **avocat**

- A possible solution is clustering similar categories, then choosing authentic names for each cluster.
