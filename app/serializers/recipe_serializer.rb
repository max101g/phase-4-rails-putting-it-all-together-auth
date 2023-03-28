class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :minutes_to_complete

  belongs_to :user
end
