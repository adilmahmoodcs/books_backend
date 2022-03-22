# frozen_string_literal: true

module Types
  class BookInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :title, String, required: false
    argument :publish_year, GraphQL::Types::ISO8601DateTime, required: false
    argument :genre, String, required: false
    argument :author_id, String, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end
