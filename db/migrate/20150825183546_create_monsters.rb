class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
    	t.string :name
    	t.string :power
    	t.integer :monster_type_id
    	t.integer :user_id
    	t.integer :team_id

      t.timestamps null: false
    end
  end
end
