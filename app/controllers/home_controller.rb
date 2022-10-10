class HomeController < ApplicationController

  def index;end

  def my_tasks
    @assigned_tasks = current_user.assigned_tasks
    @reported_tasks = current_user.reported_tasks
  end
end
