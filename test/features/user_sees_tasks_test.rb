require_relative '../test_helper'

class UserSeesTasksTest < FeatureTest

  def test_user_sees_index_of_tasks
    task1 = task_manager.create({
      title: "Coding is cool",
      description: "I know it's cool"
      })

    task2 = task_manager.create({
        title: "Learn capybara",
        description: "Swim in hottub"
        })
    # As a user
    # When I visit the tasks index
    visit '/tasks'
    # Then I should see a list of my tasks and only their titles
    within('#task_list') do
      assert page.has_content?("Coding is cool")
      assert page.has_content?("Learn capybara")
    end
  end
end

# save_and_open_page
