require 'rails/generators'

module Rbac
  module Generators
    class CreateGenerator < Rails::Generators::Base

      def self.source_root
        source_root ||= File.join(File.dirname(__FILE__), 'templates/')
      end
      
      def create_controllers
        directory "controllers/rbac", "app/controllers/rbac"
      end

      def create_models
        directory "models/rbac", "app/models/rbac"
      end

      def create_views
        directory "views/rbac", "app/views/rbac"
      end

      def add_association
        line = "class User < ActiveRecord::Base"
        gsub_file 'app/models/user.rb', /(#{Regexp.escape(line)})/mi do |match|
          "#{match}\n # User - Role many-to-many relationship\n 
                      has_many :roles, :through => :role_user, class_name: 'Rbac::Role'\n
                      has_many :role_user, dependent: :delete_all, class_name: 'Rbac::RoleUser'\n"
        end 
      end
    end
  end
end