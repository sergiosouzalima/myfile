class Datafile < ActiveRecord::Base
  belongs_to :user  
  validates :user_id, :presence => true
  validates :name, :presence => true, :length => { :maximum => 100 }
  validates_uniqueness_of :name, :scope => :user_id
  attr_accessible :name

  has_many :locals, :dependent => :destroy
  has_many :contacts, :through => :locals
  
  attr_accessible :locals_attributes  
  accepts_nested_attributes_for :locals, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
    # By using this we can create, update and destroy locals when we 
    # update a datafile’s attributes.
 

  def self.search(search)  
    if search  
      where('name LIKE ?', "%#{search}%") 
    else  
      scoped  
    end  
  end
end
