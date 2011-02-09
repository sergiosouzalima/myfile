class Filekind < ActiveRecord::Base
  belongs_to :user  
  validates :user_id, :presence => true
  validates :name, :presence => true, :length => { :maximum => 40 }
  validates_uniqueness_of :name, :scope => :user_id
  attr_accessible :name
  
  def self.search(search)  
    if search  
      where('name LIKE ?', "%#{search}%") 
    else  
      scoped  
    end  
  end


end
