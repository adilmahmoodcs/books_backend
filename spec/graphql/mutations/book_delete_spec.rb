require 'rails_helper'

module Mutations
  module Books
    RSpec.describe BookDelete, type: :request do
      describe 'resolve' do
        it 'removes a book' do
          book = create(:book)

          expect do
            post '/graphql', params: { query: query(id: book.id) }
          end.to change { Book.count }.by(-1)
        end

        it 'returns a book' do
          book = create(:book, title: 'Hero', publish_year: "2022-03-19T10:44:09.252Z", genre: 'Horror')

          post '/graphql', params: { query: query(id: book.id) }
          json = JSON.parse(response.body)
          data = json['data']['bookDelete']['book']

          expect(data).to include(
            'id'              => be_present,
            'title'           => 'Hero',
            'genre'           => 'Horror',
            'author'          => { 'id' => be_present }
          )
        end
      end

      def query(id:)
        <<~GQL
        mutation {
          bookDelete(input: {id: #{id}}) {
            book {
              id
              title
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