class AddCourtIdToHowl < ActiveRecord::Migration
  def change
  	add_column :howls, :cout_id, :integer
  end
end
