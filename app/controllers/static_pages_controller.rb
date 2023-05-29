class StaticPagesController < ApplicationController
  def home
    @projects = Project.order(created_at: :desc).limit(6)
  end
end
