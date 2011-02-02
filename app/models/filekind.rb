class Filekind < ActiveRecord::Base
  validates :name, :presence => true, :length => { :maximum => 40 }, :uniqueness => true
  attr_accessible :name
  
  def self.search(search)  
    if search  
      where('name LIKE ?', "%#{search}%") 
    else  
      scoped  
    end  
  end

end
