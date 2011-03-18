class AddUserIdToOccupations < ActiveRecord::Migration
  def self.up
    add_column :occupations, :user_id, :integer
    add_index :occupations, :user_id, :name => 'occupations_by_user_id', :length => 15
  end

  def self.down
    remove_index :occupations, :name => :occupations_by_user_id 
    remove_column :occupations, :user_id
  end
end
