class CreateHowls < ActiveRecord::Migration
  def change
    create_table :howls do |t|

      t.timestamps
    end
  end
end
