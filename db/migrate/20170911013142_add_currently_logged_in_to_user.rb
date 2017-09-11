class AddCurrentlyLoggedInToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :currently_logged_in, :boolean, index: :true
  end
end
