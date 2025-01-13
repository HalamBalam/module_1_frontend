require "test_helper"
require "view_component/test_case"

class CourseComponentTest < ViewComponent::TestCase
  def test_component_renders_all_children
    course = Course.create(title: 'Organizing your Time', price: 155.00, location: 'London')
    render_inline(CourseComponent.new(item: course, notice: 'A new test', item_counter: 1))

    assert_selector("h2", text: "Organizing your Time")
    assert_selector("h4", text: "€155.00")
    assert_selector("h4", text: "London")
    assert_text("enrollees")
    assert_text("discount")
  end
end