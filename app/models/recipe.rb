class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :steps, -> { order(:position) }, dependent: :destroy
  has_many :recipe_tags, dependent: :destroy
  has_many :tags, through: :recipe_tags

  accepts_nested_attributes_for :ingredients, allow_destroy: true
  accepts_nested_attributes_for :steps, allow_destroy: true

  validates :title, presence: true
end
