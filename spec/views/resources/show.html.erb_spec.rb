require 'rails_helper'

RSpec.describe "resources/show", type: :view do
  before(:each) do
    assign(:resource, Resource.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
