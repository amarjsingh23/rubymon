class CreateMonsterTypes < ActiveRecord::Migration
  def change
    create_table :monster_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
