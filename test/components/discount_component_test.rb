require "test_helper"
require "view_component/test_case"

class DiscountComponentTest < ViewComponent::TestCase
  def test_render_component
    course = Course.create(title: 'Organizing your Time', price: 155.00, location: 'London')
    render_inline(DiscountComponent.new(item: course))
    assert_selector 'p[class="text-green"]'
    assert_text "10% discount"
  end

  def test_component_not_rendered
    course = Course.create(title: 'Organizing your Time', price: 55.00, location: 'London')
    render_inline(DiscountComponent.new(item: course))
    refute_component_rendered
  end
end