# == Schema Information
#
# Table name: lancamentos
#
#  id          :bigint           not null, primary key
#  despesa     :boolean          default(TRUE)
#  dtlcto      :date             not null
#  dtpgto      :date
#  pagar       :boolean          not null
#  title       :string(100)      not null
#  vllcto      :decimal(, )
#  vlpgto      :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  account_id  :bigint           not null, indexed
#  category_id :bigint           not null, indexed
#  user_id     :bigint           not null, indexed
#
# Indexes
#
#  index_lancamentos_on_account_id   (account_id)
#  index_lancamentos_on_category_id  (category_id)
#  index_lancamentos_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (user_id => users.id)
#
class Lancamento < ApplicationRecord
  belongs_to :category
  belongs_to :account
  belongs_to :user
  # has_and_belongs_to_many :tags
  has_many :lancamento_tags
  has_many :tags, through: :lancamento_tags, dependent: :destroy
  accepts_nested_attributes_for :tags

  scope :allByUser, ->(user) { where(user: user) }
end
