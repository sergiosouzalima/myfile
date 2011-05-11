class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :description
      t.references :local
      t.references :contactkind

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
