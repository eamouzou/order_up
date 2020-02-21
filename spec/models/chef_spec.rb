require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  before(:each) do
    @chef3 = Chef.create(name: "chef3")
    @dish3 = @chef3.dishes.create(name: 'dish3', description: 'tasty')
    @dish6 = @chef3.dishes.create(name: 'dish6', description: 'interesting')
    @ingredient1 = Ingredient.create(name: 'ingredient1', calories: 50)
    @ingredient2 = Ingredient.create(name: 'ingredient2', calories: 100)
    @ingredient3 = Ingredient.create(name: 'ingredient3', calories: 25)
    @ingredient4 = Ingredient.create(name: 'ingredient4', calories: 10)
    @ingredient5 = Ingredient.create(name: 'ingredient5', calories: 60)
    @ingredient6 = Ingredient.create(name: 'ingredient6', calories: 180)
    DishIngredient.create(dish_id: @dish3.id, ingredient_id: @ingredient1.id)
    DishIngredient.create(dish_id: @dish3.id, ingredient_id: @ingredient2.id)
    DishIngredient.create(dish_id: @dish3.id, ingredient_id: @ingredient3.id)
    DishIngredient.create(dish_id: @dish3.id, ingredient_id: @ingredient4.id)
    DishIngredient.create(dish_id: @dish3.id, ingredient_id: @ingredient5.id)
    DishIngredient.create(dish_id: @dish6.id, ingredient_id: @ingredient6.id)
  end

  it ".get_all_ingredients" do
    expect(@chef3.get_all_ingredients).to eq(["ingredient1", "ingredient2", "ingredient3", "ingredient4", "ingredient5", "ingredient6"])
  end
end
