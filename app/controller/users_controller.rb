class UsersController < Frack::BaseController
  def index
    #@users = %w(Toan Tri Son Tu Tam)
    @users = User.all
    render 'users/index'
  end
end
