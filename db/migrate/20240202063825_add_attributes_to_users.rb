class AddAttributesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :password, :string
    add_column :users, :bio, :string
    add_column :users, :gender, :string
    add_column :users, :mobile, :integer
  end
end
