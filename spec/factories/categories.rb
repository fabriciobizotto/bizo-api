# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  active      :boolean          default(TRUE), not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           indexed
#  user_id     :bigint           not null, indexed
#
# Indexes
#
#  index_categories_on_category_id  (category_id)
#  index_categories_on_user_id      (user_id)
#
FactoryBot.define do
  factory :category do
    title { "MyString" }
    active { false }
  end
end
