require 'rails_helper'

RSpec.describe "structures/index", type: :view do
  before(:each) do
    assign(:structures, [
      Structure.create!(
        name: "Name"
      ),
      Structure.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of structures" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
