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
 
  default_scope :order => :name

  def self.search(params, current_ability)
    datafiles = Datafile.accessible_by(current_ability)
    unless params[:search].blank?
      datafiles = datafiles.
        joins("LEFT OUTER JOIN locals ON locals.datafile_id = datafiles.id").
        joins("LEFT OUTER JOIN contacts ON contacts.local_id = locals.id").
        where( [ "UPPER(contacts.description) LIKE :search_param OR UPPER(locals.name) LIKE :search_param OR UPPER(datafiles.name) LIKE :search_param", 
          { :search_param => "%#{params[:search].upcase}%"} ] ).uniq
    end    
    @datafiles = datafiles.paginate(:per_page => 10, :page => params[:page])        
    #if search  
    #  where('name LIKE ?', "%#{search}%") 
    #else  
    #  scoped  
    #end  
  end
  
end
