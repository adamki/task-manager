require '../test_helper'

class TaskManagerTest < Minitest::Test
  def test_it_creates_a_task
    attributes = {"id" => 1, "description" => "This Task", "title" => "New Task"}
    TaskManager.create(attributes)
    task = TaskManager.find(1)
  end
end
