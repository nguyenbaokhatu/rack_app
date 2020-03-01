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
      UserMailer.with(user: @user).welcome_email
      redirect('/')
    else
      render('users/new')
    end
  end

  private
  def user_params
    request.params['user']
  end
end
