require 'spec_helper'

describe "blogs/new" do
  before(:each) do
    assign(:blog, stub_model(Blog,
      :id => 1,
      :title => "MyString",
      :post => "MyText",
      :user => 1
    ).as_new_record)
  end

  it "renders new blog form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", blogs_path, "post" do
      assert_select "input#blog_id[name=?]", "blog[id]"
      assert_select "input#blog_title[name=?]", "blog[title]"
      assert_select "textarea#blog_post[name=?]", "blog[post]"
      assert_select "input#blog_user[name=?]", "blog[user]"
    end
  end
end
