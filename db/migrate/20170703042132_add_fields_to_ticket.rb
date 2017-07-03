class AddFieldsToTicket < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :jira_key, :string
  end
end
