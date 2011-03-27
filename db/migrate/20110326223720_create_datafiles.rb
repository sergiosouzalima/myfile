class CreateDatafiles < ActiveRecord::Migration
  def self.up
    create_table :datafiles do |t|
      t.string :name
      t.references :user
      t.timestamps
    end
    add_index :datafiles, :user_id, :name => 'datafiles_by_user_id', :length => 15
    add_index :datafiles, :name,    :name => 'datafiles_by_name', :length => 30
  end

  def self.down
    remove_index :datafiles, :name => :datafiles_by_user_id
    remove_index :datafiles, :name => :datafiles_by_name
    drop_table :datafiles
  end
end
