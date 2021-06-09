class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :title, null:false
      t.boolean :active, null:false, default:true
      t.boolean :investment, null:false

      t.timestamps
    end
  end
end
