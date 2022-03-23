require 'rails_helper'

RSpec.describe Book, type: :model do
  it "is valid with valid attributes" do
    author = create(:author)

    book = Book.new
    book.title = "Test"
    book.genre = "Comedy"
    book.author_id = author.id
    book.publish_year = "2022-03-19T10:44:09.252Z"

    expect(book).to be_valid
  end

  it "is not valid without a attributes" do
    book = Book.new()
    expect(book).to_not be_valid
  end
end
