class AddUserIdToFileKinds < ActiveRecord::Migration
  
  def self.up
    add_column :filekinds, :user_id, :integer
    add_index :filekinds, :user_id, :name => 'filekinds_by_user_id', :length => 15
  end

  def self.down
    remove_index :filekinds, :name => :filekinds_by_user_id # tem que informar a tabela filekinds.
    remove_column :filekinds, :user_id
  end  
  
end
