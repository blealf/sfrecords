class WishlistsController < ApplicationController
  before_action :authorize
  # before_action :set_wishlist, only: [:show, :edit, :update, :destroy]

  # GET /wishlists
  # GET /wishlists.json
  def index
    if params[:status]
      status = params[:status]
      update_status = Wishlist.find(status).update(status: true)
      wu = Wishlist.find(status)
      UserItem.create(user_id: wu.user_id, itemname: wu.itemname, itemcost: wu.itemcost, storename: wu.storename, 
        shortdescription: wu.comment, quantity: wu.quantity, amount: wu.amount, category: wu.category )
    end
    period = params[:period] || 30
    @wishlists = Wishlist.where('created_at > ?', period.to_i.days.ago).order(created_at: :desc)
    @totalCost = Wishlist.totalCost(@wishlists)
  end

  # GET /wishlists/1
  # GET /wishlists/1.json
  def show
  end

  # GET /wishlists/new
  def new
    index
    @wishlist = Wishlist.new
  end

  # GET /wishlists/1/edit
  def edit
    set_wishlist
    index
  end

  # POST /wishlists
  # POST /wishlists.json
  def create
     @wishlist = current_user.wishlists.build(wishlist_params)

    respond_to do |format|
      if @wishlist.save
        format.html { redirect_to wishlists_url, notice: 'Wishlist was successfully created.' }
        format.json { render :show, status: :created, location: @wishlist }
      else
        format.html { render :new }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wishlists/1
  # PATCH/PUT /wishlists/1.json
  def update
    @wishlist = current_user.wishlists.find(params[:id])

    respond_to do |format|
      if @wishlist.update(wishlist_params)
        format.html { redirect_to wishlists_url, notice: 'Wishlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @wishlist }
      else
        format.html { render :edit }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishlists/1
  # DELETE /wishlists/1.json
  def destroy
    @wishlist.destroy
    respond_to do |format|
      format.html { redirect_to wishlists_url, notice: 'Wishlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wishlist
      @wishlist = current_user.wishlists.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wishlist_params
      params.require(:wishlist).permit(:itemname, :comment, :itemcost, :quantity, :amount, :status, :storename, :category)
    end
end
