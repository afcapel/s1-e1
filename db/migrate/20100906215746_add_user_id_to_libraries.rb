class AddUserIdToLibraries < ActiveRecord::Migration
  def self.up
    add_column :libraries, :user_id, :integer
  end

  def self.down
    remove_column :libraries, :user_id
  end
end
