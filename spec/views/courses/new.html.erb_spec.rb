require 'rails_helper'

RSpec.describe "courses/new", type: :view do
  before(:each) do
    assign(:course, Course.new(
      :name => "MyString",
      :semester => ""
    ))
  end

  it "renders new course form" do
    render

    assert_select "form[action=?][method=?]", courses_path, "post" do

      assert_select "input#course_name[name=?]", "course[name]"

      assert_select "input#course_semester[name=?]", "course[semester]"
    end
  end
end
