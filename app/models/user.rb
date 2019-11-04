# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord

  def bookmarks
    return Bookmark.where( {:user_id => self.id} )
  end

  def bookmarked_dishes
    array_of_dish_ids = self.bookmarks.pluck(:dish_id)

    return Dish.where( {:id => array_of_dish_ids} ).distinct
  end

end
