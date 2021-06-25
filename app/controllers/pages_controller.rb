class PagesController < ApplicationController
  def home
    if !current_user.is_a?(GuestUser)
      redirect_to blogs_path
    end
  end

  def about; end
end
