module RequestMacros
  def login_admin
    before(:each) do
      @current_user = create(:admin)
      sign_in @current_user
    end
  end

  def login_user
    before(:each) do
      @current_user = create(:user)
      sign_in @current_user
    end
  end
end
