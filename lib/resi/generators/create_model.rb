require 'thor'

module Resi
  module Generators
    class CreateModel < Thor::Group
      include Thor::Actions

      namespace :resi
      argument :app_name
      argument :model_name

      def self.invoke(args)
        method = args.shift
        new(args).invoke(:create_app)
      end

      def self.source_root
        File.dirname(__FILE__)
      end

      desc 'create model'
      def create_model
        template('erb/model_rb.tt', "#{app_name}/app/models/#{model_name}.rb")
      end

      desc 'create migration'
      def create_migration
        # Create a sequel migration
      end

      desc 'create spec file'
      def create_spec
        template('erb/model_spec_rb.tt', "#{app_name}/spec/models/#{model_name}_spec.rb")
      end
    end
  end
end
