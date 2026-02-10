class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  def index
    recipes = Recipe.includes(:ingredients, :steps, :tags).order(:title)
    recipes = recipes.joins(:tags).where(tags: { name: params[:tag] }) if params[:tag].present?
    render json: recipes, include: [:ingredients, :steps, :tags]
  end

  def show
    render json: @recipe, include: [:ingredients, :steps, :tags]
  end

  def create
    recipe = Recipe.new(recipe_params)

    if params[:tag_ids].present?
      recipe.tag_ids = params[:tag_ids]
    end

    if recipe.save
      render json: recipe, include: [:ingredients, :steps, :tags], status: :created
    else
      render json: { errors: recipe.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if params[:tag_ids].present?
      @recipe.tag_ids = params[:tag_ids]
    end

    if @recipe.update(recipe_params)
      render json: @recipe, include: [:ingredients, :steps, :tags]
    else
      render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    head :no_content
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.permit(
      :title, :description, :servings, :prep_time_minutes, :cook_time_minutes,
      ingredients_attributes: [:id, :name, :quantity, :unit, :_destroy],
      steps_attributes: [:id, :position, :instruction, :_destroy]
    )
  end
end
