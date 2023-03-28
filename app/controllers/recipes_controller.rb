class RecipesController < ApplicationController
    before_action :authorize

    def index
      recipes = Recipe.includes(:user)
      render json: recipes.as_json(include: { user: { only: [:username, :image_url, :bio] } })
    end
  
    def create
      user = User.find_by(id: session[:user_id])
      recipe = user.recipes.build(recipe_params)
      if recipe.save
        render json: recipe.as_json(include: { user: { only: [:username, :image_url, :bio] } }), status: :created
      else
        render json: { errors: recipe.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def recipe_params
      params.permit(:title, :instructions, :minutes_to_complete)
    end
  
    def authorize
      render json: { errors: ['User not authorized'] }, status: :unauthorized unless session.include? :user_id
    end

end
