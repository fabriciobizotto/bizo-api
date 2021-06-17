# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE), not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           indexed
#
# Indexes
#
#  index_tags_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Tag < ApplicationRecord
  belongs_to :user
  # has_and_belongs_to_many :lancamentos
  has_many :lancamento_tags
  has_many :lancamentos, through: :lancamento_tags

  scope :allByUser, ->(user) { where(user: user) }
end
