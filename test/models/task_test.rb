require_relative '../test_helper'

class TaskTest < Minitest::Test
  def test_it_assigns_the_proper_attributes
    attributes = {"id" => 1, "description" => "This Task", "title" => "New Task"}
    task = Task.new(attributes)
    assert_equal 1, task.id
    assert_equal "This Task", task.description
    assert_equal "New Task", task.title
  end
end
