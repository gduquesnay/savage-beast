
class BeastGenerator < Rails::Generator::Base
  
  def manifest
    record do |m|
      m.migration_template "migrations/create_savage_tables.rb", 'db/migrate', :migration_file_name => "create_savage_tables"

      m.file "public/javascripts/beast.js", "public/javascripts/beast.js"
    end
  end
end
