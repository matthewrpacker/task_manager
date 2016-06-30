require_relative '../test_helper'

class TaskTest < Minitest::Test

  def test_assigns_attributes_correctly
    task = Task.new({"id" => "11", "title" => "play golf", "description" => "at overland"})

    assert_equal "11", task.id
    assert_equal "play golf", task.title
    assert_equal "at overland", task.description
  end

end
