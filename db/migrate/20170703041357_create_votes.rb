class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :value
      t.references :user
      t.references :ticket
      t.timestamps
    end
  end
end
