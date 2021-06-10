class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :title, null: false
      t.boolean :active, null: false, default: true
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
