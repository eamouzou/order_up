class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def get_all_ingredients
    require "pry"; binding.pry
  end
end
