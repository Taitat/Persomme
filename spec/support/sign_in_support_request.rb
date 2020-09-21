module SignInSupportRequest
  def sign_in_request(user)
    session_params = { session: { email: user.email, password: user.password } }
    post user_session_path, params: session_params
  end
end