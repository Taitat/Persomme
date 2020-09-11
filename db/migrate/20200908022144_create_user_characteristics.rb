class CreateUserCharacteristics < ActiveRecord::Migration[6.0]
  def change
    create_table :user_characteristics do |t|
      t.references :user,                  null: false, foreign_key: true
      t.references :characteristic,        null: false, foreign_key: true
      t.string :answer,                    null: false
      t.timestamps
    end
  end
end
