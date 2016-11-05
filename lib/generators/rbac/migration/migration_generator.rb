require 'rails/generators'
require 'rails/generators/migration'

module Rbac
  module Generators
    class MigrationGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      def self.source_root
        source_root ||= File.join(File.dirname(__FILE__), 'templates')
      end

      def self.next_migration_number(dirname)
        if ActiveRecord::Base.timestamped_migrations
          Time.new.utc.strftime("%Y%m%d%H%M%S%6N")
        else
          "%.3d" % (current_migration_number(dirname) + 1)
        end
      end

      def create_migration_file
        migration_template 'create_users.rb', 'db/migrate/create_users.rb'
        migration_template 'create_roles.rb', 'db/migrate/create_roles.rb'
        migration_template 'create_role_users.rb', 'db/migrate/create_role_users.rb'
        migration_template 'create_groups.rb', 'db/migrate/create_groups.rb'
        migration_template 'create_group_roles.rb', 'db/migrate/create_group_roles.rb'
        migration_template 'create_privileges.rb', 'db/migrate/create_privileges.rb'
        migration_template 'create_group_privileges.rb', 'db/migrate/create_group_privileges.rb'
      end
    end
  end
end