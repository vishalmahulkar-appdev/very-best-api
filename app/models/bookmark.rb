# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  image      :string
#  notes      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  dish_id    :integer
#  user_id    :integer
#  venue_id   :integer
#

class Bookmark < ApplicationRecord
end
