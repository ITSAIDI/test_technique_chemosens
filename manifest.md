# 1.Data cleaning notes

- Removing stopwords like (de, à, au...) from product names can reduce clarity. For example, "jus de pomme bio" → "jus pomme bio," which is less meaningful, so I choose not to perform this. For the category column, it is not necessary because another treatment is planned.

## 1.3 Working on Categories

Issues with `Catégorie de référence`: (examples are from `data/train.xlsx`)

- Very long and detailed categories. <br>
  Examples :<br>
  _pizzas et tartes semblables à des pizzas viandes et légumes_<br>
  _boissons au cola caféiniques faibles en calories_

- Mixed content types in some categories (common names + scientific names) witch make it unclear. <br>
  Examples :<br>
  _tomates lycopersicum esculentum_,<br>
  _brocoli brassica oleracea var italica_

- Different wording but same meaning, in other words, some categories mean essentially the same thing but are written differently, this create unnecessary categories.<br>
  Examples :<br>
  _yaourt, lait de vache, aux fruits_ vs _yaourt aux myrtilles_ -> both are **yogurt** <br>
  _avocat prêt à consommer_ vs _avocats persea americana_ -> both are **avocat**

- By locking to the train data, we can define this main categories :
  | Cleaned Category | Definition |
  |---------------------------------|---------------------------------------------------------------------------------------------|
  | boissons | boissons chaudes ou froides, incluant eau, jus, café, thé, sodas et infusions |
  | pains | pains, baguettes, brioches et autres produits de boulangerie de base |
  | patisserie | pâtisseries sucrées comme gâteaux, viennoiseries, tartes et desserts |
  | céréales et dérivés | céréales, riz, pâtes, farines et produits céréaliers transformés |
  | produits laitiers | produits laitiers tels que lait, fromage, yaourt, crème et beurre |
  | viandes et préparations | viandes, volailles, charcuteries, fraîches ou transformées |
  | poissons et fruits de mer | poissons et fruits de mer, frais, fumés, en conserve ou surgelés |
  | fruits et dérivés | fruits frais, secs, en jus ou transformés |
  | légumes et dérivés | légumes frais, secs, en conserve, surgelés ou transformés |
  | snacks | snacks salés ou sucrés comme chips, biscuits, barres et confiseries |
  | plats préparés | repas prêts à consommer comme pizzas, sandwiches, hamburgers, soupes, gratins, pâtes cuites, salades, plats surgelés ou en conserve|
  | œufs et préparations | œufs et produits à base d’œufs comme omelettes, poudres ou préparations |
  | produits de cacao | cacao, chocolat, poudres et produits dérivés |
  | sauces | sauces prêtes à l’emploi ou préparées, comme ketchup, mayonnaise, moutarde, sauces tomate et condiments |

- The idea is to automatically assign a new category from _cleaned_categories_ based on the raw one. We can achieve this by using an embedding model to encode both the raw categories and the definitions of the cleaned ones. The reason for using definitions instead of the categories directly is that they are richer in meaning, which allows for a better mapping of raw categories to the new ones.
- The process can produce some incorrect matches, such as:
  | Product | Bad match | Real match |
  |--------------------------------|--------------------------------|-----------------|
  | jus de pomme | fruits et dérivés | boissons |
  | croissant fourré à la confiture | pains | patisserie |

In total 12 incorrect matches from 97 (Accuarcy of 88 %)

- The results are saved in _data/train_grouped_categories.xlsx_
