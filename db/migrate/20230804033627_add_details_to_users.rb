class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :age, :string
    add_column :users, :lastname, :string
  end
end
