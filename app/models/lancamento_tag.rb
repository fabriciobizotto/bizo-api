# == Schema Information
#
# Table name: lancamento_tags
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  lancamento_id :bigint           not null, indexed
#  tag_id        :bigint           not null, indexed
#
# Indexes
#
#  index_lancamento_tags_on_lancamento_id  (lancamento_id)
#  index_lancamento_tags_on_tag_id         (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (lancamento_id => lancamentos.id)
#  fk_rails_...  (tag_id => tags.id)
#
class LancamentoTag < ApplicationRecord
  belongs_to :tag
  belongs_to :lancamento
end
