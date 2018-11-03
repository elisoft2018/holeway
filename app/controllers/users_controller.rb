class UsersController < ApplicationController
  require 'bcrypt'
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # POST /users
  # POST /users.json
  def create
    @user=User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password_digest])
        
        render json: @user, status: :logged
      else
        @user = User.new(user_params)
         if @user.save
           render :show, status: :created, location: @user
          else
            render json: @user.errors, status: :unprocessable_entity
          end
      end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password_digest, :name, :surname, :address, :token, :enabled)
    end
    

end
