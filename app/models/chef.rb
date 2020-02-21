class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def get_all_ingredients
    # dishes.first.ingredients.pluck(:name)
    Ingredient.where(id: DishIngredient.where(dish_id: dishes.pluck(:id)).pluck(:ingredient_id)).pluck(:name)
  end
end
