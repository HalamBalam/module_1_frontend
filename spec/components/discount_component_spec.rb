require "rails_helper"

RSpec.describe DiscountComponent, type: :component do

  it "renders the component correctly" do
    course = Course.create(title: 'Organizing your Time', price: 155.00, location: 'London')
    rendered_component = render_inline(DiscountComponent.new(item: course))
    expect(rendered_component).to have_css "p[class='text-green']", text: "10% discount"
    expect(rendered_component).to have_css "img[src*='/assets/star']"
  end
end