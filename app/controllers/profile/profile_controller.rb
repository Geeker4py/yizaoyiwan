class Profile::ProfileController < ApplicationController
  def index
    @user = current_user
  end
end
