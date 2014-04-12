class User < ActiveRecord::Base
	has_and_belongs_to_many :courts
	has_many :howls

	attr_accessible :deviceId
end