require 'spec_helper' # The require command will load the spec/spec_helper.rb file, to use the Rspec.

describe Contactkind do

  before(:each) do
    @attr = { :name => "contactkind test name" }
    @user_id = 1
  end

  it "should be created with success" do
    contactkind = Contactkind.new( @attr )
    contactkind.user_id = @user_id
    contactkind.should be_valid
  end  

  it "should require a user" do
    contactkind = Contactkind.new( @attr )
    contactkind.should_not be_valid
  end

  it "should require a name" do
    contactkind = Contactkind.new( :name => "" )
    contactkind.user_id = @user_id
    contactkind.should_not be_valid
  end

  it "should reject names that are too long" do
    long_name = "a" * 26
    long_name_contactkind = Contactkind.new( @attr.merge(:name => long_name) )
    long_name_contactkind.user_id = @user_id
    long_name_contactkind.should_not be_valid
  end

  it "should reject duplicate names and user" do
    # Put a user with given name into the database.
    contactkind = Contactkind.new( @attr )
    contactkind.user_id = @user_id
    contactkind.save
    contactkind_with_duplicate_user = Contactkind.new( @attr )
    contactkind_with_duplicate_user.user_id = @user_id
    contactkind_with_duplicate_user.save
    contactkind_with_duplicate_user.should_not be_valid
  end	

  it "should belongs to" do
    user = User.create(:email => "test@example.com", :password => "123456", :password_confirmation => "123456")
    contactkind = Contactkind.new( @attr )
    contactkind.user_id = user
    contactkind.save
    user.should have(14).contactkind
  end
  
end