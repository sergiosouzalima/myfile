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
  
  def show_second_contact_description( datafile )
    if datafile.locals.any?
      unless datafile.locals.first.contacts.second.blank?
        datafile.locals.first.contacts.second.description
      end
    end
  end
  
end
