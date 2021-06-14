class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :title, null:false
      t.boolean :active, null:false, default:true
      t.references :category, null:true, index:true

      t.timestamps
    end
  end
end
