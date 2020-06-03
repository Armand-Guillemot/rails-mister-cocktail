class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, :cocktail, :ingredient, presence: true
  validates :cocktail, uniqueness: { scope: :ingredient, message: "You can only add the same ingredient once per cocktail" }
end
