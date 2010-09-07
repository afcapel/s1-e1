class AddUrlToLibrary < ActiveRecord::Migration
  def self.up
    add_column :libraries, :url, :string
  end

  def self.down
    remove_column :libraries, :url
  end
end
