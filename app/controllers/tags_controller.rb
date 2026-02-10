class TagsController < ApplicationController
  def index
    render json: Tag.all
  end

  def show
    tag = Tag.find(params[:id])
    render json: tag, include: :recipes
  end
end
