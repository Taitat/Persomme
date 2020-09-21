class AddTitleToCharacteristic < ActiveRecord::Migration[6.0]
  def change
    add_column :characteristics, :title, :string
  end
end
