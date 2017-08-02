class UserItemsController < ApplicationController
  before_action :authorize
  #before_action :set_user_item, only: [:edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /user_items
  # GET /user_items.json
  def index
    #======================================================================================
    # Display all item
    #category #Item category
    # @chart_period = info_period.to_i.days.ago
    # @chart_sort = sort_column
    # @chart_direction = sort_direction
    
    #@user_items = UserItem.where("created_at >= #{(Time.now - 5.days).utc.iso8601}")
    range = "created_at #{(info_period.to_i.days.ago.utc...Time.now.utc).to_s(:db)}"
    @user_item_chart = UserItem.where(range)
    #@user_item_chart = UserItem.find_by_sql("SELECT * FROM user_items ORDER BY #{sort_column} #{sort_direction}")
    #@user_items = UserItem.where('created_at > ?', info_period.to_i.days.ago).order(sort_column + ' ' + sort_direction)
    @user_item_bp = @user_item_chart.order(sort_column + ' ' + sort_direction)
    #@user_items = UserItem.where('created_at > ?', Time.now - info_period.to_i.days).order(sort_column + ' ' + sort_direction)
    @totalCost = UserItem.totalCost(@user_item_bp)
    @totalQuantity = UserItem.totalQuantity(@user_item_bp)
    @user_item_months = UserItem.all.to_a.group_by { |u| u.created_at.beginning_of_month }
    @user_items = @user_item_bp.paginate(:page => params[:page], :per_page => 3)
    #======================================================================================

    # @user_items = UserItem.where('created_at > ? and user_id = ?', info_period.to_i.days.ago, current_user.id).order(sort_column + ' ' + sort_direction)
    # @totalCost = UserItem.totalCost(@user_items)
    # @totalQuantity = UserItem.totalQuantity(@user_items)
  end

  # GET /user_items/1
  # GET /user_items/1.json
  # def show
  # end

  # GET /user_items/new
  def new

    # Display all items
    self.index
    #======================================================================================

    # New item
    @user_item = current_user.user_items.new

  end

  # GET /user_items/1/edit
  def edit
    self.index
    set_user_item
  end

  # POST /user_items
  # POST /user_items.json
  def create
    @user_item = current_user.user_items.build(user_item_params)

    respond_to do |format|
      if @user_item.save
        format.html { redirect_to root_url, notice: 'User item was successfully created.' }
        format.json { render :show, status: :created, location: @user_item }
        format.js
      else
        format.html { render :new }
        format.json { render json: @user_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_items/1
  # PATCH/PUT /user_items/1.json
  def update
    @user_item = current_user.user_items.find(params[:id])
      
    respond_to do |format|
      if @user_item.update(user_item_params)
        @user_item.amount = @user_item.quantity*@user_item.itemcost
        format.html { redirect_to root_url, notice: 'User item was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_item }
      else
        format.html { render :edit }
        format.json { render json: @user_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_items/1
  # DELETE /user_items/1.json
  def destroy
    @user_item = current_user.user_items.find(params[:id])
    @user_item.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'User item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_item
      #@user_item = UserItem.find(params[:id])
      @user_item = current_user.user_items.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_item_params
      params.require(:user_item).permit(:user_id, :itemname, :storename, :shortdescription, :quantity, :itemcost, :amount, :category)
    end

    def info_period
      params[:period] || 30
    end

    def sort_column
      #params[:sort] || "created_at"
      UserItem.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end

    def sort_direction
      #params[:direction] || "asc"
      %w[desc asc].include?(params[:direction]) ? params[:direction] : "desc"
    end

    # def authorize
    #   unless User.find_by(id: session[:user_id])
    #     redirect_to login_url, notice: "Please log in"
    #   end
    # end


end
