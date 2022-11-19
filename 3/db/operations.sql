-- DB Schema 
CREATE TABLE IF NOT EXISTS category (
    categoryid INT NOT NULL PRIMARY KEY,
    title VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS article (
    articleid INT NOT NULL PRIMARY KEY,
    title VARCHAR NOT NULL,
    articletext TEXT,
    categoryid INT,
    FOREIGN KEY(categoryid) REFERENCES category(categoryid)
);

CREATE TABLE IF NOT EXISTS article_links_articles (
    articleid1 INT NOT NULL,
    articleid2 INT NOT NULL,
    FOREIGN KEY(articleid1) REFERENCES article(articleid1),
    FOREIGN KEY(articleid2) REFERENCES article(articleid2)
);

-- Populating tables 
INSERT INTO category VALUES
(1, "Biology"), (2, "Computer science");

INSERT INTO article VALUES
(1, "Biological organisation", "Biological organisation is the hierarchy of complex biological structures and systems that define life using a reductionistic approach.[1] The traditional hierarchy, as detailed below, extends from atoms to biospheres. The higher levels of this scheme are often referred to as an ecological organisation concept, or as the field, hierarchical ecology.", 1),
(2, "Kingdom (biology)", "Traditionally, some textbooks from the United States and Canada used a system of six kingdoms (Animalia, Plantae, Fungi, Protista, Archaea/Archaebacteria, and Bacteria/Eubacteria) while textbooks in Great Britain, India, Greece, Brazil and other countries use five kingdoms only (Animalia, Plantae, Fungi, Protista and Monera).", 1),
(3, "Central processing unit", "A central processing unit (CPU), also called a central processor, main processor or just processor, is the electronic circuitry that executes instructions comprising a computer program. The CPU performs basic arithmetic, logic, controlling, and input/output (I/O) operations specified by the instructions in the program. This contrasts with external components such as main memory and I/O circuitry,[1] and specialized processors such as graphics processing units (GPUs).", 2),
(4, "Class hierarchy", "A class hierarchy or inheritance tree in computer science is a classification of object types, denoting objects as the instantiations of classes (class is like a blueprint, the object is what is built from that blueprint) inter-relating the various classes by relationships such as 'inherits', 'extends', 'is an abstraction of', 'an interface definition'.[1] In object-oriented programming, a class is a template that defines the state and behavior common to objects of a certain kind. A class can be defined in terms of other classes", 2),
(5, "Database", "In computing, a database is an organized collection of data stored and accessed electronically. Small databases can be stored on a file system, while large databases are hosted on computer clusters or cloud storage. The design of databases spans formal techniques and practical considerations, including data modeling, efficient data representation and storage, query languages, security and privacy of sensitive data, and distributed computing issues, including supporting concurrent access and fault tolerance.", 2),
(6, "Inheritance (object-oriented programming)", "In object-oriented programming, inheritance is the mechanism of basing an object or class upon another object (prototype-based inheritance) or class (class-based inheritance), retaining similar implementation. Also defined as deriving new classes (sub classes) from existing ones such as super class or base class and then forming them into a hierarchy of classes. In most class-based object-oriented languages, an object created through inheritance, a 'child object', acquires all the properties and behaviors of the 'parent object' , with the exception of: constructors, destructor, overloaded operators and friend functions of the base class. Inheritance allows programmers to create classes that are built upon existing classes,[1] to specify a new implementation while maintaining the same behaviors (realizing an interface), to reuse code and to independently extend original software via public classes and interfaces. The relationships of objects or classes through inheritance give rise to a directed acyclic graph.", 2);

INSERT INTO article_links_articles VALUES
(4, 1), (4, 6), (6, 1);

/* Operations */
-- Access article details based on the article’s “title
SELECT * FROM article WHERE title = "Class hierarchy";
-- Finding related articles (those that link to one another) from a given article
--   Finding related articles to Class hierarchy <articleid=4>
SELECT title FROM article
WHERE articleid = (SELECT articleid2 FROM article_links_articles WHERE articleid1 = 4);
-- Retrieving all articles for one category
SELECT article.title FROM article 
INNER JOIN category ON article.categoryid = category.categoryid
WHERE category.categoryid = 1;