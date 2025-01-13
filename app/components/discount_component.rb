# frozen_string_literal: true

class DiscountComponent < ViewComponent::Base
  def initialize(item:)
    @item = item
  end

  def render?
    @item.price >= 100
  end

  def before_render
    @star_icon = helpers.star_icon
  end
end
