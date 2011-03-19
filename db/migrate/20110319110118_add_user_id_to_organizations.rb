class AddUserIdToOrganizations < ActiveRecord::Migration
  def self.up
    add_column :organizations, :user_id, :integer
    add_index :organizations, :user_id, :name => 'organizations_by_user_id', :length => 15
  end

  def self.down
    remove_index :organizations, :name => :organizations_by_user_id
    remove_column :organizations, :user_id
  end
end
