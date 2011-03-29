class AddTwitterToContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :twitter_handler, :string
  end

  def self.down
    remove_column :contacts, :twitter_handler
  end
end
