class AddUserToAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :user_id, :integer
    # add_foreign_key :accounts, :users
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    # add_reference :accounts, :user, null: false, foreign_key: true
  end
end
