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
FactoryBot.define do
  factory :beer do
    name { "MyString" }
    abv { "9.99" }
  end
end
