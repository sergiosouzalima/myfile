class Contactkind < ActiveRecord::Base
  belongs_to :user
  has_many :contacts  
  validates :user_id, :presence => true
  validates :name, :presence => true, :length => { :maximum => 25 }
  validates_uniqueness_of :name, :scope => :user_id

end
