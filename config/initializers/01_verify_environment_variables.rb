# config/initializers/01_verify_environment_variables.rb

required_variables = %w[SMTP_USERNAME SMTP_PASSWORD]

required_variables.each do |env_name|
 if ENV[env_name].blank?
   raise "Missing environment variable: #{env_name}"
 end
end
