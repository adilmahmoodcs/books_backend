require 'rails_helper'

RSpec.describe Author, type: :model do
  it "is valid with valid attributes" do
    author = Author.new
    author.firstname = "jane"
    author.surname = "doe"
    author.dob = "2022-03-19T10:44:09.252Z"

    expect(author).to be_valid
  end

  it "is not valid without a attributes" do
    author = Author.new()
    expect(author).to_not be_valid
  end
end
