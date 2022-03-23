# frozen_string_literal: true

module Types
  class BookInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :title, String, required: true
    argument :publish_year, GraphQL::Types::ISO8601DateTime, required: true
    argument :genre, String, required: true
    argument :author_id, Integer, required: true
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end
