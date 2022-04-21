class PartySerializer < ActiveModel::Serializer
  attributes :id, :name, :datetime, :guest_list, :location, :user_id
end
