class Webhooks::BookSerializer < Webhooks::ApplicationSerializer

  attributes :id, :title, :publish_year, :genre
  
  belongs_to :author, serializer: Webhooks::AuthorSerializer

  def published_at
    object.publish_year.strftime('%m/%d/%Y')
  end
end
