class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :birthdate, :date, null: false
    add_column :users, :gender, :integer, default: 0, null: false
    add_column :users, :school, :string, null: false
  end
end
