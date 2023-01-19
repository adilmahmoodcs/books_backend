# frozen_string_literal: true

require "rails_helper"

RSpec.describe Webhooks::BookSerializer do
  subject { described_class.new(book).as_json }
  let(:author) { create(:author) }
  let(:book) { build(:book, id: 1, genre: "comedy", author: author) }

  it { is_expected.to include(id: 1) }
  it { is_expected.to include(title: book.title) }
  it { is_expected.to include(genre: "comedy") }
  it { is_expected.to include(:author) }
end
