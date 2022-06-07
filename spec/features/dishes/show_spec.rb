require 'rails_helper'

RSpec.describe 'dish show page' type: :feature do
    before :each do
        @chef = Chef.create(name: "Chef Boyardee")
        @dish = @chef.dishes.create(name: "Ravioli", description: "Cheap.")
        @dish2 = @chef.dishes.create(name: "Lasagna", description: "Also cheap.")
        @ingredient = Ingredient.create(name: "Sodium", calories: 400)
        @ingredient2 = Ingredient.create(name: "Sauce", calories: 350)
        @ingredient3 = Ingredient.create(name: "Sugar", calories: 550)
        @ingredient4 = Ingredient.create(name: "Noodles", calories: 600)
        DishIngredient.create(dish_id: "#{@dish.id}", ingredient_id: "#{@ingredient.id}")
        DishIngredient.create(dish_id: "#{@dish.id}", ingredient_id: "#{@ingredient2.id}")
        DishIngredient.create(dish_id: "#{@dish2.id}", ingredient_id: "#{@ingredient3.id}")
        DishIngredient.create(dish_id: "#{@dish.id}", ingredient_id: "#{@ingredient4.id}")
        DishIngredient.create(dish_id: "#{@dish.id}", ingredient_id: "#{@ingredient4.id}")
    end


    it 'shows dish name and description' do
        visit "/dishes/#{@dish.id}"
        expect(page).to have_content(@dish.name)
        expect(page).to have_content(@dish.description)
        expect(page).to_not have_content(@dish2.name)
        expect(page).to_not have_content(@dish2.description)
    end

    it 'shows a list of ingredients' do

    end

    it 'shows the chefs name' do

    end
end