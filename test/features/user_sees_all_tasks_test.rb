require_relative '../test_helper'

class UserSeesAllTasksTest < FeatureTest

  def test_all_tasks_are_displayed
    visit '/'
    assert_equal '/', current_path
  end

  def test_front_page_has_welcome_content
    visit '/'
    assert page.has_content?("Welcome to the Task Manager")
  end

  def test_front_page_has_welcome_content_2
    visit '/'
    within('#test') do
      assert page.has_content?("Welcome to the Task Manager")
    end
  end

  def test_it_can_create_a_new_task
    visit '/'
    click_link "New Task"
    fill_in "task[title]", with: "wash car"
    fill_in "task[description]", with: "bubbly bubbly"
    click_link_or_button "Submit"
    assert_equal "/tasks", current_path
    assert page.has_content?("wash car")
  end

  def test_it_can_edit_a_task
    visit '/'
    click_link "New Task"
    fill_in "task[title]", with: "wash car"
    fill_in "task[description]", with: "bubbly bubbly"
    click_link_or_button "Submit"
    assert_equal "/tasks", current_path
    click_on "Edit"
    assert_equal "/tasks/1/edit", current_path
    fill_in "task[title]", with: "peanuts"
    click_link_or_button "Submit"
    assert page.has_content?("peanuts")
  end

  def test_it_can_delete_a_task
    visit '/'
    click_link "New Task"
    fill_in "task[title]", with: "wash car"
    fill_in "task[description]", with: "bubbly bubbly"
    click_link_or_button "Submit"
    assert_equal "/tasks", current_path
    click_on "delete/"
    save_and_open_page
    assert_equal "/tasks", current_path
  end

end
