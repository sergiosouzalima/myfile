class Occupation < ActiveRecord::Base
  belongs_to :user  
  validates :user_id, :presence => true
  validates :name, :presence => true, :length => { :maximum => 100 }
  validates_uniqueness_of :name, :scope => :user_id
   
end
