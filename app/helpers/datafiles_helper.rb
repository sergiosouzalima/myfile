module DatafilesHelper
  
  def show_label_or_check_box( f )
    ! (f.object.nil? || f.object.new_record?)
  end
  
end
