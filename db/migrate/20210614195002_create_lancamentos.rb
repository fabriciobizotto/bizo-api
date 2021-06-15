class CreateLancamentos < ActiveRecord::Migration[6.0]
  def change
    create_table :lancamentos do |t|
      t.string :title, limit: 100, null:false
      t.date :dtlcto, null:false
      t.date :dtpgto
      t.decimal :vllcto
      t.decimal :vlpgto
      t.boolean :pagar, null:false, defaut:false
      t.references :category, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
