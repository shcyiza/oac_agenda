class VisitorsController < ApplicationController

  def index
    @users = User.all
  end

  def firstconnection
  end

end
