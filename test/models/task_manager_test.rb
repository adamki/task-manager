require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def test_it_creates_a_task
    attributes = {id: 1, description: "This Task", title: "New Task"}
    TaskManager.create(attributes)
    task = TaskManager.find(1)

    assert_equal 1, task.id
    assert_equal "This Task", task.description
    assert_equal "New Task", task.title
  end
end
