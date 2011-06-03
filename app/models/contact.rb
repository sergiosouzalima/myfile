class Contact < ActiveRecord::Base
  belongs_to :local
  belongs_to :contactkind
  validates :description, :length => { :maximum => 60 } 
  validate :email_should_be_valid
  
  def email_should_be_valid
    puts '===================='
    puts self.contactkind_id
    puts self.description 
    puts '===================='
    errors.add( :description, "*" ) if (contactkind.name == 'email' || contactkind.name == 'email2') && !(self.description =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i)
  end
  
end
