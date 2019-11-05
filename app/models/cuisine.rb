# == Schema Information
#
# Table name: cuisines
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cuisine < ApplicationRecord

  def dishes
    return Dish.where( {:cuisine_id => self.id} ).distinct
  end
  

end
