class AddUserToCategory < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!
  def change
    # add_column :categories, :user_id, :integer
    # add_index :categorias, :user_id
    add_reference :categories, :user, null: false, index: {algorithm: :concurrently}
  end
end
