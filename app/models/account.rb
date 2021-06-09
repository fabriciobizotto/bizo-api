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
#
class Account < ApplicationRecord
end
