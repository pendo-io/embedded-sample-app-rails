class Users::SessionsController < Devise::SessionsController
  def new
    if session[:fake_user_email].blank?
      fake_user = User.random
      fake_user.save!
      session[:fake_user_email] = fake_user.email
    end
    @fake_user_email = session[:fake_user_email]
    super
  end

  def destroy
    @fake_user_email = session[:fake_user_email]
    super
    session[:fake_user_email] = @fake_user_email
  end

end
