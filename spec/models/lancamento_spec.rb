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
require 'rails_helper'

RSpec.describe Lancamento, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
