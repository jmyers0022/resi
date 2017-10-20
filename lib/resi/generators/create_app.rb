require 'thor'

module Resi
  module Generators
    class CreateApp < Thor::Group
      include Thor::Actions

      namespace :resi
      argument :name

      def self.invoke(args)
        method = args.shift
        new(args).invoke(:create_app)
      end

      def self.source_root
        File.dirname(__FILE__)
      end

      desc 'create app.rb file'
      def create_app_file
        template('erb/app_rb.tt', "#{name}/config/app.rb")
      end

      desc 'create db config'
      def create_db_config
        template('erb/db_yml.tt', "#{name}/config/db.yml")
      end

      desc 'create root route'
      def create_root_route
        template('erb/route_rb.tt', "#{name}/app/routes/root.rb", path: '')
      end

      desc 'create app layout'
      def create_app_layout
        template('erb/layout_erb.tt', "#{name}/app/layouts/app_layout.erb")
      end

      desc 'stub js files'
      def stub_js_files
        template('erb/app_js.tt', "#{name}/app/assets/js/App.js")
        template('erb/example_component_js.tt', "#{name}/app/assets/js/components/ExampleComponent.js")
      end

      desc 'stub scss files'
      def stub_scss_files
        template('erb/app_scss.tt', "#{name}/app/assets/scss/app.scss")
        template('erb/variables_scss.tt', "#{name}/app/assets/scss/variables.scss")
        template('erb/reset_scss.tt', "#{name}/app/assets/scss/reset.scss")
      end

      desc 'stub app directories'
      def stub_app_directories
        create_file "#{name}/app/models/.gitkeep"
        create_file "#{name}/db/migrations/.gitkeep"
      end

      desc 'create build files'
      def create_build_files
        template('erb/gemfile.tt', "#{name}/Gemfile")
        template('erb/babelrc.tt', "#{name}/.babelrc")
        template('erb/eslintrc_json.tt', "#{name}/.eslintrc.json")
        template('erb/gitignore.tt', "#{name}/.gitignore")
        template('erb/config_ru.tt', "#{name}/config.ru")
        template('erb/package_json.tt', "#{name}/package.json")
        template('erb/rakefile.tt', "#{name}/Rakefile")
        template('erb/webpack_config_js.tt', "#{name}/webpack.config.js")
      end
    end
  end
end
