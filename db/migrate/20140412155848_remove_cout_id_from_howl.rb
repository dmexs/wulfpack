class RemoveCoutIdFromHowl < ActiveRecord::Migration
  def change
  	remove_column :howls, :cout_id
  end
end
