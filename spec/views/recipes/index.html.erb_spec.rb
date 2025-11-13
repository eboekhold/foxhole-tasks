require 'rails_helper'

RSpec.xdescribe "recipes/index", type: :view do
  before(:each) do
    assign(:recipes, [
      Recipe.create!(),
      Recipe.create!()
    ])
  end

  it "renders a list of recipes" do
    render
    cell_selector = 'div>p'
  end
end
