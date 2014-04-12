class AddCourtIdToHowl2 < ActiveRecord::Migration
  def change
  	add_column :howls, :court_id, :integer
  end
end
