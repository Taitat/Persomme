class AddSelectedIdsToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :selected_ids, :string
  end
end
