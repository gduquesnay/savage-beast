
class BeastGenerator < Rails::Generator::Base
  
  def manifest
    record do |m|
      m.migration_template "migrations/create_savage_tables.rb", 'db/migrate', :migration_file_name => "create_savage_tables"
    end
  end
end
