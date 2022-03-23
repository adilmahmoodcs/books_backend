class Author < ApplicationRecord
    has_many :books, dependent: :destroy

    validates_presence_of :firstname
    validates_presence_of :surname
    validates_presence_of :dob
end
