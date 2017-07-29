class ProposedItemsController < ApplicationController
  #before_action :set_proposed_item, only: [:show, :edit, :update, :destroy]

  # GET /proposed_items/1/edit
  def edit
    set_proposed_item
    @proposed_items = Budget.find(params[:budget_id]).proposed_items.all
  end

  # POST /proposed_items
  # POST /proposed_items.json
  def create
    @budget = Budget.find(params[:budget_id])
    @proposed_item = @budget.proposed_items.build(proposed_item_params)

    respond_to do |format|
      if @proposed_item.save
        format.html { redirect_to @budget, notice: 'Proposed item was successfully created.' }
        format.json { render :show, status: :created, location: @proposed_item }
      else
        format.html { render 'budgets/_proposed_item' }
        format.json { render json: @proposed_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposed_items/1
  # PATCH/PUT /proposed_items/1.json
  def update
    set_proposed_item

    respond_to do |format|
      if @proposed_item.update(proposed_item_params)
        format.html { redirect_to @budget, notice: 'Proposed item was successfully updated.' }
        format.json { render :show, status: :ok, location: @proposed_item }
      else
        format.html { render :edit }
        format.json { render json: @proposed_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposed_items/1
  # DELETE /proposed_items/1.json
  def destroy
    #@budget = Budget.find(params[:budget_id])
    #@Proposed_item = @budget.proposed_items.find(params[:id])
    set_proposed_item
    calculate_saving

    @proposed_item.destroy
    respond_to do |format|
      format.html { redirect_to @budget, notice: 'Proposed item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposed_item
      @budget = Budget.find(params[:budget_id])
      @proposed_item = @budget.proposed_items.find_by(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposed_item_params
      params.require(:proposed_item).permit(:name, :comment, :cost, :quantity, :amount, :category, :budget_id)
    end

    def calculate_spending
      budget = Budget.find(params[:budget_id])
      if (budget.spending - @proposed_item.amount < 0)
        spending = 0
      else
        spending = budget.spending - @proposed_item.amount
      end
      budget.update(spending: spending)
    end

    def calculate_saving
      calculate_spending
      budget = Budget.find(params[:budget_id])
      saving = budget.income.to_f - budget.spending
      budget.update(saving: saving)   
    end
end
