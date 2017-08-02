
class BudgetsController < ApplicationController
  before_action :authorize
  # before_action :set_budget, only: [:show, :edit, :update, :destroy]

  # GET /budgets
  # GET /budgets.json
  def index
    @budgets = Budget.all
  end

  # def edit_income
  #   @budget = Budget.find(params[:id])
  #   @proposed_income = @budget.proposed_incomes.find_by(params[:id])
  #   @proposed_incomes = Budget.find(params[:budget_id]).proposed_incomes.all
  # end

  # def edit_item
  #   set_proposed_item
  #   @proposed_items = Budget.find(params[:budget_id]).proposed_items.all
  # end

  # GET /budgets/1
  # GET /budgets/1.json
  def show
    @proposed_item = ProposedItem.new
    @proposed_income = ProposedIncome.new

    @proposed_items = set_budget.proposed_items.all
    @proposed_incomes = set_budget.proposed_incomes.all
  end

  # GET /budgets/new
  def new
    self.index
    @budget = Budget.new
  end

  # GET /budgets/1/edit
  def edit
    index
    set_budget
  end

  # POST /budgets
  # POST /budgets.json
  def create
    @budget = current_user.budgets.new(budget_params)

    respond_to do |format|
      if @budget.save
        format.html { redirect_to @budget, notice: 'Budget was successfully created.' }
        format.json { render :show, status: :created, location: @budget }
      else
        format.html { render :new }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /budgets/1
  # PATCH/PUT /budgets/1.json
  def update
    set_budget
    respond_to do |format|
      if @budget.update(budget_params)
        format.html { redirect_to @budget, notice: 'Budget was successfully updated.' }
        format.json { render :show, status: :ok, location: @budget }
      else
        format.html { render :edit }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/1
  # DELETE /budgets/1.json
  def destroy
    set_budget
    @budget.destroy
    respond_to do |format|
      format.html { redirect_to budgets_url, notice: 'Budget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget
      @budget = Budget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def budget_params
      params.require(:budget).permit(:user_id, :title, :description, :spending, :income, :savings)
    end
    
end
