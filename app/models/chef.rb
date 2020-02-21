class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def get_all_ingredients
    # dishes.select('ingredients.*').joins(:ingredients).distinct #(mike's approach)
    # with approach above, in your chef's ingredients index view, you change ingredients to ingredients.name
    # because it returns dish objects with name attributes
    # could also do: dishes.select('ingredients.name').joins(:ingredients).distinct
    Ingredient.where(id: DishIngredient.where(dish_id: dishes.pluck(:id)).pluck(:ingredient_id)).pluck(:name)
  end
end
