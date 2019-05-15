# Persistence with rom-rb

## Exercises

### Setup

- [ ] `bundle install`

### Getting started, writing data

- [ ] Write a migration for an "articles" table
  - `id` primary key, `title` text, and `published` boolean columns
- [x] Create a relation (with inferred schema)
- [x] Create a repo for the relation
- [x] Create some records
  - enable `create` command on repo
- [x] Use `#by_pk` to read records back
- [ ] Update some records
  - enable `update` comand on repo using `by_pk` restriction

### Building queries

- [ ] Add methods to repository to query and return multiple records
  - [ ] listing of published articles
- [ ] Move lower-level query methods into relation
  - `#published` method in relation
  - update repository to use this method
  - create some articles where published is both true and false, ensure they're returned as appropriate
- [ ] Add methods to repository to return single records
- [ ] Create shared `articles` method in repository to ensure all query methods return only published articles
- [ ] Return results as custom structs via a custom struct namespace

### Reading aggregates

- [ ] Write a migration for an associated "authors" table
  - `id` primary key and `name` text column
  - add `author_id` foreign key to "articles" table
- [ ] Add a relation for the table and declare associations
  - declare `belongs_to :author` assocition in "articles" relation
- [ ] Create a repository for authors, with "create" command enabled
- [ ] Create author records
- [ ] Create article records with `author_id` attribute filled
- [ ] In "articles" repository, return aggregate objects including the articles' authors

### Changesets

- [ ] Implement `publish(author, article)` in the articles repository that will use `:create` changeset to create a new article, mark it as published and associate with the author
- [ ] Implement `unpublish(article)` in the articles repository that will use `:update` changeset to mark the article as not published

## Further exploration...

### Building queries

- [ ] Return custom structs using `map_to`
- [ ] Investigate using dry-struct to build custom struct classes with strict attribute types

### Testing

- [ ] Write tests for your repository methods
  - Use rom-factory to create records
  - Write tests to assert that repository methods return appropriate records
