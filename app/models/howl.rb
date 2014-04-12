class Howl < ActiveRecord::Base
	belongs_to :user
	belongs_to :court

	attr_accessible :created_at
end
