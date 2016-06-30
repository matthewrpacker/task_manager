require_relative '../test_helper'

class TaskManagerTest < MiniTest::Test
  include TestHelpers

  def task_manager_empty
    assert_equal 0, task_manager.all.count
  end

  def test_it_creates_a_task
    task_manager_empty

    task_manager.create({title: "clean", description: "house"})

    assert_equal 1, task_manager.all.count

    task = task_manager.find(task_manager.all.count)

    assert_equal "clean", task.title
    assert_equal "house", task.description
    assert_instance_of Task, task
  end

  def test_it_returns_all_tasks
    task_manager_empty

    task_manager.create({title: "clean", description: "house"})
    task_manager.create({title: "cook", description: "food"})
    task_manager.create({title: "drive", description: "car"})

    task_manager.all.each do |task|
      assert_instance_of Task, task
    end
  end

  def test_it_can_find_tasks
    task_manager.create({title: "clean", description: "house"})
    task_manager.create({title: "cook", description: "food"})
    task_manager.create({title: "drive", description: "car"})

    task = task_manager.find(2)

    assert_equal "cook", task.title
    assert_equal "food", task.description
  end

  def test_it_can_update_a_task
    task_manager.create({title: "clean", description: "house"})

    task_manager.update(1, {title: "cook", description: "food"})

    task = task_manager.find(1)

    assert_equal "cook", task.title
    assert_equal "food", task.description
  end

  def test_destroy
    task_manager_empty
    task_manager.create({title: "clean", description: "house"})
    task_manager.destroy(1)
    task_manager_empty
  end
end
