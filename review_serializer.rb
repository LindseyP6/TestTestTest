class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :song_id, :super_fan_id, :rating, :comment

end
