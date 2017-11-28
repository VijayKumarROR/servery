class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :alpha_num, :string
    add_column :users, :role, :boolean
  end
end
