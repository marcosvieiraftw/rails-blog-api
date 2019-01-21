class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :follow_user, :unfollow_user]
  load_and_authorize_resource

  # GET /users
  def index
    @users = User.all
    render json: UserSerializer.new(@users).serialized_json
  end

  # GET /users/1
  def show
    render json: UserSerializer.new(@user).serialized_json
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: UserSerializer.new(@user).serialized_json, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: UserSerializer.new(@user).serialized_json
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.soft_delete!
  end

  def follow_user
    if @user.create_follower(current_user.id)
      return render json: UserSerializer.new(@user).serialized_json
    end

    return render json: @user.errors.full_messages, status: :unprocessable_entity
  end

  def unfollow_user
    if @user.destroy_follower(current_user.id)
      return render json: UserSerializer.new(@user).serialized_json
    end

    return render json: @user.errors.full_messages, status: :unprocessable_entity
  end

  def get_logged_user
    render json: UserSerializer.new(current_user).serialized_json
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
