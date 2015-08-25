class Monster < ActiveRecord::Base
	belongs_to :user
	belongs_to :monster_type
	belongs_to :team

	validates :name, :power, :monster_type, :user, presence: true
	validates_with MonsterSizeValidator
end
