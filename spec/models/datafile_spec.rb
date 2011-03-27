
require 'spec_helper' # The require command will load the spec/spec_helper.rb file, to use the Rspec.

describe Datafile do

  before(:each) do
    @attr = { :name => "datafile test name" }
    @user_id = 1
  end

  it "should be created with success" do
    datafile = Datafile.new( @attr )
    datafile.user_id = @user_id
    datafile.should be_valid
  end  

  it "should require a user" do
    datafile = Datafile.new( @attr )
    datafile.should_not be_valid
  end

  it "should require a name" do
    datafile = Datafile.new( :name => "" )
    datafile.user_id = @user_id
    datafile.should_not be_valid
  end

  it "should reject names that are too long" do
    long_name = "a" * 101
    long_name_datafile = Datafile.new( @attr.merge(:name => long_name) )
    long_name_datafile.user_id = @user_id
    long_name_datafile.should_not be_valid
  end

  it "should reject duplicate names and user" do
    # Put a user with given name into the database.
    datafile = Datafile.new( @attr )
    datafile.user_id = @user_id
    datafile.save
    datafile_with_duplicate_user = Datafile.new( @attr )
    datafile_with_duplicate_user.user_id = @user_id
    datafile_with_duplicate_user.save
    datafile_with_duplicate_user.should_not be_valid
  end	

  it "should belongs to" do
    user = User.create(:email => "test@example.com", :password => "123456", :password_confirmation => "123456")
    datafile = Datafile.new( @attr )
    datafile.user_id = user
    datafile.save
    user.should have(1).datafile
  end
  
end  