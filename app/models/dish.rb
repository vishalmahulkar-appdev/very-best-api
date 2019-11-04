# == Schema Information
#
# Table name: dishes
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cuisine_id :integer
#

class Dish < ApplicationRecord

  def bookmarks
    return Bookmark.where( {:dish_id => self.id} )
  end


end
