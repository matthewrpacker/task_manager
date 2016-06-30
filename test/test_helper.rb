ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)

require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/dsl'
require 'launchy'

module TestHelpers

  def teardown
    task_manager.delete_all
    super
  end

  def task_manager
    database = YAML::Store.new('db/task_manager_test')
    @database ||= TaskManager.new(database)
  end
end

Capybara.app = TaskManagerApp

class FeatureTest < MiniTest::Test
  include Capybara::DSL
  include TestHelpers
end