# Store a description of the respective data model, describe how the operations can be executed, and give at least one example.
In this task, we will create various data models for typical Wikipedia data. Firstly, we need to consider the data we want to store. Each article should store the following properties:
- Title
- Text
- Category
- Links to related articles

The following operations should be possible:
- Access article details based on the article’s “title”
- Finding related articles (those that link to one another) from a given article
- Retrieving all articles for one category

# Relational
For this data model and in order to implement all operations we will need to have 3 tables:
- Article
- Article_has_Article
- Category

Where this tables in SQL will be defined as:
```sql
CREATE TABLE Category (
    ID NOT NULL PRIMARY KEY,
    Title VARCHAR(50) UNIQUE
);

CREATE TABLE Article (
    ID INT NOT NULL PRIMARY KEY
    Title VARCHAR(100) UNIQUE,
    Article_Text TEXT,
    has_category INT FOREIGN KEY REFERENCES Category(ID)
);

CREATE TABLE Article_has_Article (
    id_article1 INT FOREIGN KEY REFERENCES Article(ID),
    id_article2 INT FOREIGN KEY REFERENCES Article(ID)
);
```

The operations can be executed via queries through `SELECT`.
- For the first one a simple `SELECT` can be ran with a `WHERE` clause to look for the title's article
- The second operation can be done having the `ID` of the given article and then running a `SELECT` query in the `Article_has_Article` table looking for all the rows that has the given `ID`
- Finally to access all articles from a particular category, we would need the ID from this category and run a query looking for the Articles that has this ID in the `has_category` field

For instance, to access an article based on its title, we can do it through the following query
```sql
SELECT * FROM Article WHERE Title = '`title_to_search`';
```

# Columnar
A columnar data model would follow the same [Relational](#relational) schema, since the only difference between these 2 models is how data is stored phyisically, so the same structure can be implemented.

# Key-Value
For this data model a similar approach as the [Document](#document) model can be followed, since the `key` part can represent the `_id` that in most of the cases is automatically generated, as for the `value` part most of the key-value databases can have similar attributes.

# Document
For a document data model I find suitable to have 2 documents (1 document could also be possible if `Category` table doesn't get more complex):
- Article
- Category

Where a document could have the following structure in MongoDB.
```json
{
    _id: 123456789, // Where this ID is automatically generated
    title: "Article title",
    text: "Article text",
    category: "Article category", // This could be a number that can reference an ID for another category document instead
    linked_articles: [234567890, 345678901, ...] // All the Article IDs that are linked to the current article
}
```

# Graph
Finally in a graph data model we don't have a structure, but we would be creating nodes for every article (and/or category) we want to store within our database and creating `links` relationships within nodes
