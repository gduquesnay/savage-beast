require 'pathname'

class BeastGenerator < Rails::Generator::Base
  
  def manifest
    record do |m|
      m.migration_template "migrations/create_savage_tables.rb", 'db/migrate', :migration_file_name => "create_savage_tables"

      destination_root = "/public/"
      templates_dir = (Pathname(__FILE__).dirname + 'templates').expand_path
      
      %w(stylesheets images javascripts).each{|asset|
        destination_path = destination_root + asset
        m.dir destination_path + "/savage_beast"
        
        Dir[templates_dir + 'public' + asset + '*'].each do |f|
          from_file = Pathname(f).relative_path_from(templates_dir)
          dirname, basename = from_file.split
          f.file(file, dirname + 'savage_beast' + basename)
        end
      }
      
      m.file "public/javascripts/beast.js", "public/javascripts/beast.js"
    end
  end
end
