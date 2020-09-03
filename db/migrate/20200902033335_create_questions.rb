class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.references :user,          null: false, foreign_key: true
      t.string :title,             null: false
      t.text :content,             null: false
      t.integer :genre_id,         null: false, default: 1
      t.timestamps
    end
  end
end
