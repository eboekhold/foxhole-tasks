require 'rails_helper'

RSpec.describe "structures/new", type: :view do
  before(:each) do
    assign(:structure, Structure.new(
      name: "MyString"
    ))
  end

  it "renders new structure form" do
    render

    assert_select "form[action=?][method=?]", structures_path, "post" do

      assert_select "input[name=?]", "structure[name]"
    end
  end
end
