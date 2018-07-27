require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'sqlite3'

RSpec::Core::RakeTask.new(:spec)

namespace :sirample do
  namespace :db do
    desc "Create Database"
    task :create do
      # remove sqlite db if exists
      File.delete('data.db') if File.exists?('data.db')
      db = SQLite3::Database.new 'data.db'

      db.execute <<-SQL
        CREATE TABLE staff (
          `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          `created_at` DATETIME NULL,
          `updated_at` DATETIME NULL,
          `name` VARCHAR(255) NOT NULL
        )
      SQL
    end
  end
end

task :default => :spec
