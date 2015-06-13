class WelcomeController < ApplicationController
  def index
    @links = Link.all
    render 'welcome.html.erb'
  end
end
