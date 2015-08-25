class MonsterSizeValidator < ActiveModel::Validator
	MONSTERS_SIZE = 20

  def validate(record)
  	user = record.user
    if user.present?
	    if user.monsters.size > MONSTERS_SIZE
	    	record.errors[:monster] << "You have already #{MONSTERS_SIZE} monsters."
	    end
	  end
  end
end