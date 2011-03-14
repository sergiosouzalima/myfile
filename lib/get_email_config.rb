class GetEmailConfig
  attr_accessor :email, :password
  
  def initialize
      config = YAML.load_file("#{Rails.root}/config/email_config.yml")
      ENV['RAILS_ENV'] = 'development' unless ENV['RAILS_ENV'] 
      @email           = config[ENV['RAILS_ENV']]['email']
      @password        = config[ENV['RAILS_ENV']]['password']  
  end
  
end  