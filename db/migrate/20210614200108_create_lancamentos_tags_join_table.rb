class CreateLancamentosTagsJoinTable < ActiveRecord::Migration[6.0]
  def up
    create_table :lancamentos_tags, primary_key: [:lancamento_id, :tag_id] do |t|
      t.integer :lancamento_id, null:false
      t.integer :tag_id, null:false
      t.index [:lancamento_id, :tag_id]
      t.index [:tag_id, :lancamento_id]
    end
    # add_foreign_key :lancamentos_tags, :tags, validate: false
    # add_foreign_key :lancamentos_tags, :lancamentos, validate: false
  end

  def down
    drop_table :lancamentos_tags
  end
  
end
