require 'rails_helper'

RSpec.describe "structures/edit", type: :view do
  let(:structure) {
    Structure.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:structure, structure)
  end

  it "renders the edit structure form" do
    render

    assert_select "form[action=?][method=?]", structure_path(structure), "post" do

      assert_select "input[name=?]", "structure[name]"
    end
  end
end
