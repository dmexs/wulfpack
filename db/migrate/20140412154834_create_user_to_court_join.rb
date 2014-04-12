class CreateUserToCourtJoin < ActiveRecord::Migration
  def change
    create_table :users_courts do |t|
    	t.integer :court_id
    	t.integer :user_id
    end
  end
end
