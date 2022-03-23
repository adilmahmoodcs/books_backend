require 'rails_helper'

module Mutations
  module Books
    RSpec.describe BookDelete, type: :request do
      describe 'resolve' do
        it 'removes a Author' do
          author = create(:author)

          expect do
            post '/graphql', params: { query: query(id: author.id) }
          end.to change { Author.count }.by(-1)
        end

        it 'returns a book' do
          author = create(:author, firstname: 'Jane', surname: 'smith', dob: "2022-03-19T10:44:09.252Z")

          post '/graphql', params: { query: query(id: author.id) }
          json = JSON.parse(response.body)
          data = json['data']['authorDelete']['author']

          expect(data).to include(
            'id'              => be_present,
            'firstname'       => 'Jane',
            'surname'         => 'smith',
          )
        end
      end

      def query(id:)
        <<~GQL
        mutation {
            authorDelete(input: {id: #{id}}) {
              author {
                id
                firstname
                surname
                dob
              }
            }
          }
               
        GQL
      end
    end
  end
end