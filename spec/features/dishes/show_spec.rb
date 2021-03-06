require 'rails_helper'

RSpec.describe "dish show page", type: :feature do
  before(:each) do
    @chef1 = Chef.create(name: "chef1")
    @chef2 = Chef.create(name: "chef2")
    @chef3 = Chef.create(name: "chef3")

    @dish1 = @chef1.dishes.create(name: 'dish1', description: 'great')
    @dish2 = @chef2.dishes.create(name: 'dish2', description: 'lovely')
    @dish3 = @chef3.dishes.create(name: 'dish3', description: 'tasty')
    @dish4 = @chef1.dishes.create(name: 'dish4', description: 'sweet')
    @dish5 = @chef2.dishes.create(name: 'dish5', description: 'scrumptious')
    @dish6 = @chef3.dishes.create(name: 'dish6', description: 'interesting')

    @ingredient1 = Ingredient.create(name: 'ingredient1', calories: 50)
    @ingredient2 = Ingredient.create(name: 'ingredient2', calories: 100)
    @ingredient3 = Ingredient.create(name: 'ingredient3', calories: 25)
    @ingredient4 = Ingredient.create(name: 'ingredient4', calories: 10)
    @ingredient5 = Ingredient.create(name: 'ingredient5', calories: 60)
    @ingredient6 = Ingredient.create(name: 'ingredient6', calories: 180)

    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
    DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient3.id)
    DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient4.id)
    DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient5.id)
    DishIngredient.create(dish_id: @dish3.id, ingredient_id: @ingredient1.id)
    DishIngredient.create(dish_id: @dish3.id, ingredient_id: @ingredient2.id)
    DishIngredient.create(dish_id: @dish3.id, ingredient_id: @ingredient3.id)
    DishIngredient.create(dish_id: @dish3.id, ingredient_id: @ingredient4.id)
    DishIngredient.create(dish_id: @dish3.id, ingredient_id: @ingredient5.id)
    DishIngredient.create(dish_id: @dish4.id, ingredient_id: @ingredient2.id)
    DishIngredient.create(dish_id: @dish4.id, ingredient_id: @ingredient4.id)
    DishIngredient.create(dish_id: @dish5.id, ingredient_id: @ingredient5.id)
    DishIngredient.create(dish_id: @dish5.id, ingredient_id: @ingredient6.id)
    DishIngredient.create(dish_id: @dish6.id, ingredient_id: @ingredient6.id)

  end

  scenario "see chef name and ingredients list for that dish" do
    visit "/dishes/#{@dish1.id}"

    expect(page).to have_content('chef1')
    expect(page).to have_content('ingredient1 ingredient2 ingredient3')
  end

  scenario "see total calorie count" do
    visit "/dishes/#{@dish4.id}"

    expect(page).to have_content('Total Calorie Count: 110')
  end

end
