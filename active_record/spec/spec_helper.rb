require_relative "../config/application"
ActiveRecord::Base.logger = nil

def migrate(version = nil)
  version = nil
  # byebug
  ActiveRecord::Migration.verbose = false
  (ActiveRecord::MigrationContext.new('./db/migrate', schema_migration = ActiveRecord::SchemaMigration)).migrate(version)
  #version = ENV['VERSION'] ? ENV['VERSION'].to_i : nil
  #byebug
  #m.migrate(version)
end

def create_db
  `rm -rf #{ActiveRecord::Base.configurations["test"]["database"]}`
  ActiveRecord::Base.establish_connection(:test)
end

def drop_db
  `rm -rf #{ActiveRecord::Base.configurations["test"]["database"]}`
end
