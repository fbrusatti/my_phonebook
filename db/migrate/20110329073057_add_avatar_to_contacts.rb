class AddAvatarToContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :avatar_file_name, :string
    add_column :contacts, :avatar_content_type, :string
    add_column :contacts, :avatar_file_size, :integer
    add_column :contacts, :avatar_updated_at, :datetime
  end

  def self.down
    remove_column :contacts, :avatar_updated_at
    remove_column :contacts, :avatar_file_size
    remove_column :contacts, :avatar_content_type
    remove_column :contacts, :avatar_file_name
  end
end
