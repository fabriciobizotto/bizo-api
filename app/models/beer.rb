# == Schema Information
#
# Table name: beers
#
#  id         :bigint           not null, primary key
#  abv        :decimal(, )
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Beer < ApplicationRecord
    validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}
    validates :abv, presence: true
    
end
