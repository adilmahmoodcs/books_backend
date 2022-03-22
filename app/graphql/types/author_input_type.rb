# frozen_string_literal: true

module Types
  class AuthorInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :firstname, String, required: false
    argument :surname, String, required: false
    argument :dob, GraphQL::Types::ISO8601DateTime, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end
