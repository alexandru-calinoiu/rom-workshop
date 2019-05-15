require "bundler/setup"
require "pry"
require "rom-repository"

require_relative "setup"

MIGRATION = Persistence.db.migration do
  change do
    create_table :authors do
      primary_key :id
      column :name, :text, null: false
    end

    create_table :articles do
      primary_key :id
      column :title, :text, null: false
      column :published, :boolean, null: false, default: false
      foreign_key :author_id, :authors
    end
  end
end

# TODO: add exercise code here

class Articles < ROM::Relation[:sql]
  schema(infer: true)

  auto_struct(true)
end

class ArticleRepository < ROM::Repository[:articles]
  commands :create, update: :by_pk
end


if $0 == __FILE__
  # Start with a clean database each time
  Persistence.reset_with_migration(MIGRATION)
  Persistence.finalize

  # TODO: play around here ;)

  article_relation = Persistence.rom.relations[:articles]
  article_repo = ArticleRepository.new(Persistence.rom)

  article = article_repo.create(title: 'Ion o batuto pe Maria, iar!')
  article = article_relation.by_pk(article.id).one!

  article_repo.update(article.id, publish: true)
  article = article_relation.by_pk(article.id).one!

  binding.pry
end
