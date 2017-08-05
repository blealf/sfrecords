class AccesoriesController < ApplicationController
  # before_action :set_accesory, only: []
  before_action :admin_user, only: [:index, :show, :edit, :new, :update, :destroy]

  # GET /accesories
  # GET /accesories.json
  def about
    @abouts = Accesory.where(acc_type: "About")
  end

  def contact
    @contacts = Accesory.where(acc_type: "Contact")
  end
  def term
    @terms = Accesory.where(acc_type: "Term")
  end

  def index
    @accesories = Accesory.all
  end

  # GET /accesories/1
  # GET /accesories/1.json
  def show
    set_accesory
  end

  # GET /accesories/new
  def new
    @accesory = Accesory.new
  end

  # GET /accesories/1/edit
  def edit
    set_accesory
  end

  # POST /accesories
  # POST /accesories.json
  def create
    @accesory = Accesory.new(accesory_params)

    respond_to do |format|
      if @accesory.save
        format.html { redirect_to @accesory, notice: 'Accesory was successfully created.' }
        format.json { render :show, status: :created, location: @accesory }
      else
        format.html { render :new }
        format.json { render json: @accesory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accesories/1
  # PATCH/PUT /accesories/1.json
  def update
    set_accesory
    respond_to do |format|
      if @accesory.update(accesory_params)
        format.html { redirect_to @accesory, notice: 'Accesory was successfully updated.' }
        format.json { render :show, status: :ok, location: @accesory }
      else
        format.html { render :edit }
        format.json { render json: @accesory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accesories/1
  # DELETE /accesories/1.json
  def destroy
    set_accesory
    @accesory.destroy
    respond_to do |format|
      format.html { redirect_to accesories_url, notice: 'Accesory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accesory
      @accesory = Accesory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accesory_params
      params.require(:accesory).permit(:title, :body, :acc_type)
    end
end
