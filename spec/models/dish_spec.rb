require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  before(:each) do
    @chef1 = Chef.create(name: "chef1")
    @dish1 = @chef1.dishes.create(name: 'dish1', description: 'great')
    @dish4 = @chef1.dishes.create(name: 'dish4', description: 'sweet')
    @ingredient1 = Ingredient.create(name: 'ingredient1', calories: 50)
    @ingredient2 = Ingredient.create(name: 'ingredient2', calories: 100)
    @ingredient3 = Ingredient.create(name: 'ingredient3', calories: 25)
    @ingredient4 = Ingredient.create(name: 'ingredient4', calories: 10)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient3.id)
    DishIngredient.create(dish_id: @dish4.id, ingredient_id: @ingredient2.id)
    DishIngredient.create(dish_id: @dish4.id, ingredient_id: @ingredient4.id)
  end

  it ".total_calorie_count" do
    expect(@dish1.total_calorie_count).to eq(175)
    expect(@dish4.total_calorie_count).to eq(110)
  end
end
