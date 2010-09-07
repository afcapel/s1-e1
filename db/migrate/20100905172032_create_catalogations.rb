class CreateCatalogations < ActiveRecord::Migration
  def self.up
    create_table :catalogations do |t|
      t.integer :book_id
      t.integer :library_id
      t.integer :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :catalogations
  end
end
