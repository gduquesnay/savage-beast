require 'pathname'

class BeastGenerator < Rails::Generator::Base
  
  def manifest
    record do |m|
      destination_root = "/public/"
      templates_dir = (Pathname(__FILE__).dirname + 'templates').expand_path
      
      %w(stylesheets images javascripts).each { |asset|
        destination_path = destination_root + asset
        assets_dir = templates_dir + 'public' + asset
        
        m.directory destination_path + "/savage_beast"

        Pathname.glob(assets_dir + '**' + '*') do |file|
          destination_file = (assets_dir + 'savage_beast' + file.relative_path_from(assets_dir)).relative_path_from(templates_dir).to_s
          source_file = file.relative_path_from(templates_dir).to_s
          
          if file.directory?
            m.directory destination_file
          else
            m.file source_file, destination_file
          end
        end
      }

      m.migration_template "migrations/create_savage_tables.rb", 'db/migrate', :migration_file_name => "create_savage_tables"
    end
  end
end
