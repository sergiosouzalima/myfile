class CreateContactkinds < ActiveRecord::Migration
  def self.up
    create_table :contactkinds do |t|
      t.string :name
      t.references :user
      t.timestamps
    end
    add_index :contactkinds, :user_id, :name => 'contactkinds_by_user_id', :length => 15
  end

  def self.down
    remove_index :contactkinds, :name => :contactkinds_by_user_id
    drop_table :contactkinds
  end
end
