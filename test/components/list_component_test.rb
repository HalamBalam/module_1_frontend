require "test_helper"
require "view_component/test_case"

class ListComponentTest < ViewComponent::TestCase
  def test_renders_slots_with_content
    render_inline(ListComponent.new) do |component|
      component.with_header { "A Test List" }
      component.with_titles [{title: 'Test title 1'}, {title: 'Test title 2'}]
    end

    assert_selector("h1", text: "A Test List")

    assert_text("Test title 1")
    assert_text("Test title 2")
  end
end