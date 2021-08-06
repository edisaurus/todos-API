class UsersController < ApplicationController
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token}
    json_reponse(reponse, :created)
  end

  private

  def user_params
    params.permit(
        :name,
        :email,
        :password,
        :password_confirmation
    )
  end
end
