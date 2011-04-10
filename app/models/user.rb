class User < ActiveRecord::Base
  has_many :filekinds, :dependent => :destroy
  has_many :occupations, :dependent => :destroy
  has_many :organizations, :dependent => :destroy
  has_many :datafiles, :dependent => :destroy
  has_many :contactkinds, :dependent => :destroy
  
  after_create :create_contact_kinds
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :token_authenticatable, :confirmable, :lockable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  private
    def create_contact_kinds
      %w(fax site site2 email email2 phone phone2 mobile mobile2 blog linkedin facebook twitter).each do |name|
        Contactkind.create( :name => name, :user_id => self.id )
      end
    end
    
end
