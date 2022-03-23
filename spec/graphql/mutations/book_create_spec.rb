require 'rails_helper'

module Mutations
  module Books
    RSpec.describe BookCreate, type: :request do
      describe '.resolve' do
        it 'creates a book' do
          author = create(:author)

          expect do
            post '/graphql', params: { query: query(author_id: author.id) }
          end.to change { Book.count }.by(1)
        end

        it 'returns a book' do
          author = create(:author)

          post '/graphql', params: { query: query(author_id: author.id) }
          json = JSON.parse(response.body)
          data = json['data']['bookCreate']['book']

          expect(data).to include(
            'id'              => be_present,
            'title'           => 'Tripwire',
            'genre'           => 'Thriller',
            'author'          => { 'id' => author.id.to_s }
          )
        end
      end

      def query(author_id:)
        <<~GQL
            mutation {
                bookCreate(
                input: {bookInput: {title: "Tripwire", genre: "Thriller", authorId: #{author_id}, publishYear: "2022-03-19T10:44:09.252Z"}}
                ) {
                    book {
                        id
                        title
                        publishYear
                        genre
                        author {
                            id
                        }
                    }
                }
            }
        GQL
      end
    end
  end
end