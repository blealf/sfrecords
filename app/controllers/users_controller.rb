class UsersController < ApplicationController
  before_action :authorize,  only: [:index, :show, :edit, :update]
  before_action :admin_user, only: [:index, :destroy]
  # before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    set_user
    @user_spending  = User.totalSpending(current_user.id)
    @user_income    = User.totalIncome(current_user.id)
  end

  # GET /users/new
  def new
    @user = User.new
    currency_unit
  end

  # GET /users/1/edit
  def edit
    set_user
    currency_unit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        log_in @user
        format.html { redirect_to @user, notice: 'Welcome to PMM Account' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    set_user
    currency_unit

    if params[:user][:password].blank?
      params[:user].delete :password
      params[:user].delete :password_confirmation
    end
    respond_to do |format|
      if @user.update(user_edit_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      # if @user.admin = true
      #   @user = User.find(params[:id])
      # else
      #   @user = User.find(current_user.id)
      # end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:role, :firstname, :lastname, :othernames, :email, :password, :password_confirmation, :unit)
    end

    def user_edit_params
      params.require(:user).permit(:firstname, :lastname, :othernames, :email, :occupation, :username, :unit)
    end

    def currency_unit
      @units = ["CAD", "USD", "EUR", "GBP", "AUD", "NZD", "NGN", "YEN", "BGN", "CHF"]
    end


end
