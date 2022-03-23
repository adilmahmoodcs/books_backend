require 'rails_helper'

module Mutations
  module Books
    RSpec.describe AuthorCreate, type: :request do
      describe '.resolve' do
        it 'creates a Author' do
          expect do
            post '/graphql', params: { query: query() }
          end.to change { Author.count }.by(1)
        end

        it 'returns a author on delete' do
          post '/graphql', params: { query: query() }
          json = JSON.parse(response.body)
          data = json['data']['authorCreate']['author']

          expect(data).to include(
            'id'                => be_present,
            'firstname'         => 'John',
            'surname'           => 'doe',
          )
        end
      end

      def query()
        <<~GQL
        mutation {
            authorCreate(
              input: {authorInput: {firstname: "John", surname: "doe", dob: "2022-03-19T10:44:09.252Z"}}
            ) {
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