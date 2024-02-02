class RemoveChangePasswordStringToDigest < ActiveRecord::Migration[6.1]
  def change
    def up
      # This method is intentionally left blank
    end
  
    def down
      # Revert the changes made by the migration you want to remove
      change_column :users, :password, :string
    end
  end
end
