require 'rails_helper'
require 'nokogiri'

describe "posts/new.html.erb" do
    let(:post) { Post.new }


    # For view tests, the render method will render the view. You can
    # run tests on the HTML that results from renderng the view by
    # invoking `rendered`

    # If you want to test to see if certain html tags are present,
    # you can parse the HTML string using the Nokogiri gem.
    # You can then use css selectors ("tag", ".class", "#id") to find
    # certain items on a page. See the 'renders a form' test below.

    it 'has content New Post' do
        assign(:post, post)
        render template: "posts/new.html.erb"
        expect(rendered).to include("New Post")
    end

    it 'renders a form' do
        assign(:post, post)
        render template: "posts/new.html.erb"
        rendered_page = Nokogiri::HTML(rendered)
        expect(rendered_page.css('form').count).to eq(1)
    end
end