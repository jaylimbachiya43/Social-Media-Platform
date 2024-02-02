class ChangeintegerToBigint < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :mobile, :bigint
  end
end
