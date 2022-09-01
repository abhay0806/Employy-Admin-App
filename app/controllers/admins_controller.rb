class AdminsController < ApplicationController

   before_action :authorized?, only: [:edit, :update, :destroy]

  def authorized?
    unless Admin.create?(current_user, @employee)
      render :file => "public/404.html", :status => :unauthorized
    end
  end
end
