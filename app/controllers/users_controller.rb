class UsersController < Frack::BaseController
  def index
    @users = User.all
    render 'users/index'
  end

  def new
    @user = User.new
    render 'users/new'
  end

  def create
    @user = User.new (user_params)
    if @user.save
      redirect('/')
    else
      render('users/new')
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password_digest)
  end
end
