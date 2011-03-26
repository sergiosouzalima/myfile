require 'spec_helper' # The require command will load the spec/spec_helper.rb file, to use the Rspec.


#
#  ...added the following line into environments/test.rb :
# This assumes you're running your local development server on port 3000 via script/server
# config.action_mailer.default_url_options = { :host => "127.0.0.1:3000" }
#

describe Filekind do
   
  before(:each) do
    @attr = { :name => "filekind test name" }
    @user_id = 1
  end
  
  it "should be created with success" do
    filekind = Filekind.new( @attr )
    filekind.user_id = @user_id
    filekind.should be_valid
  end  

  it "should require a user" do
    filekind = Filekind.new( @attr )
    filekind.should_not be_valid
  end

  it "should require a name" do
    filekind = Filekind.new( :name => "" )
    filekind.user_id = @user_id
    filekind.should_not be_valid
  end

	it "should reject names that are too long" do
	  long_name = "a" * 41
    long_name_filekind = Filekind.new( @attr.merge(:name => long_name) )
    long_name_filekind.user_id = @user_id
	  long_name_filekind.should_not be_valid
	end
	
  it "should reject duplicate names and user" do
    # Put a user with given name into the database.
    filekind = Filekind.new( @attr )
    filekind.user_id = @user_id
    filekind.save
    filekind_with_duplicate_user = Filekind.new( @attr )
    filekind_with_duplicate_user.user_id = @user_id
    filekind_with_duplicate_user.save
    filekind_with_duplicate_user.should_not be_valid
    #Filekind.create!(:name => "Organizer test", :user_id => 3)
    #name_with_duplicate_user = Filekind.new(:name => "Organizer test", :user_id => 3)
    #name_with_duplicate_user.should_not be_valid
  end	
  
  it "should belongs to" do
    user = User.create(:email => "test@example.com", :password => "123456", :password_confirmation => "123456")
    filekind = Filekind.new( @attr )
    filekind.user_id = user
    filekind.save
    user.should have(1).filekind
  end
    
end








