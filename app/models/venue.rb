# == Schema Information
#
# Table name: venues
#
#  id              :integer          not null, primary key
#  address         :string
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  neighborhood_id :integer
#

class Venue < ApplicationRecord
end
