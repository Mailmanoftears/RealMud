require 'active_record'
require 'sqlite3'
require 'yaml'
require 'rainbow'

# This is some boilerplate code to read the config/database.yml file
# And connect to the database
config_path = File.join(File.dirname(__FILE__), "database.yml")
ActiveRecord::Base.configurations = YAML.load_file(config_path)
ActiveRecord::Base.establish_connection(:development)

# Set a logger so that you can view the SQL actually performed by ActiveRecord
logger = Logger.new(STDOUT)
logger.formatter = proc do |_severity, _datetime, _progname, msg|
  "#{msg}\n"
end
ActiveRecord::Base.logger = logger


# # Doing the requires seperately only to be able to manipulate them better if needed
Dir["#{__dir__}/../app/*/*.rb"].each { |file| require file }

# Disable/SQL logging
ActiveRecord::Base.logger = nil

router = Router.new
router.run

