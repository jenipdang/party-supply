class SupplySerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :in_stock
end
