require 'rails_helper'

RSpec.describe "chef show page", type: :feature do
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

  scenario "see chef name and ingredients list link" do
    visit "/chefs/#{@chef3.id}"

    expect(page).to have_content('chef3')
    expect(page).to have_link('All Ingredients List')
  end

end

# Story 3 of 3
# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses

# <p>Ingredients List: <% @dish.ingredients.each do |ingredient|%>
#                     <%= ingredient.name %>
#                     <% end %></p>
