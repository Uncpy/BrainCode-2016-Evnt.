class UsersController < ApplicationController
  def show
    @user = current_user
    @joined_events = @user.attended_events
    @created_events = @user.events.all
  end
end
