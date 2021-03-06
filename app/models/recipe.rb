class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ratings
  has_many :recipe_ingredients
  has_many :ingredients, :through => :recipe_ingredients

  validates :name, presence: true, uniqueness: true

  def ibu
    ibu = 0
    recipe_ingredients.each do |recipe_ingredient|
      if(!recipe_ingredient.use.nil? && recipe_ingredient.use.name != 'Dry Hop' && boil_gravity && boil_time && batch_size && !recipe_ingredient.amount.nil?)
        fG = 1.65 * 0.000125**(boil_gravity - 1)
        hop_boil = recipe_ingredient.time.nil? ? boil_time : recipe_ingredient.time
        fT = (1 - Math::E**(-0.04 * hop_boil)) / 4.15
        u = fG * fT
        ibu = ((recipe_ingredient.amount * recipe_ingredient.ingredient.alpha) * u * (75 / batch_size)) + ibu
      end
    end
    return (ibu).round(2)
  end

  def color
    color = 0
    recipe_ingredients.each do |ingredient|
      if(!ingredient.amount.nil? && !ingredient.ingredient.color.nil?)
        color = ((ingredient.amount * ingredient.ingredient.color) / batch_size) + color
      end
    end
    color = 1.4922 * (color ** 0.6859)
    return color > 50 ? 50 : (color).round(2)
  end

end
