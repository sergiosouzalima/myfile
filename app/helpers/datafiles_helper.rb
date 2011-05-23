module DatafilesHelper
  
  def show_label_or_check_box( f )
    ! (f.object.nil? || f.object.new_record?)
  end
  
  def show_first_contact_description( datafile )
    if datafile.locals.any?
      if datafile.locals.first.contacts.any?
        datafile.locals.first.contacts.first.description
      end
    end
  end
  
end
