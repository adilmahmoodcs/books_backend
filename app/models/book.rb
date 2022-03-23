class Book < ApplicationRecord
    belongs_to :author

    validates_presence_of :title
    validates_presence_of :genre
    validates_presence_of :author_id
    validates_presence_of :publish_year
end
