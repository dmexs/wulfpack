class AddUserIdToHowl < ActiveRecord::Migration
  def change
  	add_column :howls, :user_id, :integer
  end
end
