class Local < ActiveRecord::Base
  belongs_to :datafile
  validates :name, :length => { :maximum => 50 }
  has_many :contacts, :dependent => :destroy
  attr_accessible :name
  
  attr_accessible :contacts_attributes
  accepts_nested_attributes_for :contacts, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true  
end
