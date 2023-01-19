class Webhooks::ApplicationSerializer < ActiveModel::Serializer
  def event_type
    instance_options[:event_type]
  end
end
