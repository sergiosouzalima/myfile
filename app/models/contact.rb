class Contact < ActiveRecord::Base
  belongs_to :local
  belongs_to :contactkind
  validates :description, :length => { :maximum => 60 }  
end
