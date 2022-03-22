module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :books,
          [Types::BookType],
          null: false,
          description: 'Return a list of books'

    def books
      Book.all
    end

    field :book, Types::BookType, null: false, description: 'Returns requested book' do
      argument :id, ID, required: true
    end

    def book(id: nil)
      Book.find_by(id: id)
    end

    field :authors,
          [Types::AuthorType],
          null: false,
          description: 'Return a list of authors'

    def authors
      Author.all
    end

    field :author, Types::AuthorType, null: false, description: 'Returns requested author' do
      argument :id, ID, required: true
    end

    def author(id: nil)
      Author.find_by(id: id)
    end
  end
end
