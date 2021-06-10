# == Schema Information
#
# Table name: accounts
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE), not null
#  investment :boolean          not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Account, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
