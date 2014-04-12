class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :deviceId

      t.timestamps
    end
  end
end
