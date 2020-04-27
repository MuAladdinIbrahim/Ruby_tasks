class ItemSerializer < ActiveModel::Serializer
  attribute :name, key: :item_name
  attribute :description, key: :item_description
end

## $ rails g serializer item