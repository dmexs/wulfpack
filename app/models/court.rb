class Court < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :howls

	attr_accessible :name,
					:latitude,
					:longitude
end
