class ProposedIncomesController < ApplicationController
  before_action :set_proposed_income, only: [:show, :edit, :update, :destroy]

  # GET /proposed_incomes/1/edit


  # POST /proposed_incomes
  # POST /proposed_incomes.json
  def create
    @budget = Budget.find(params[:budget_id])
    @proposed_income = @budget.proposed_incomes.build(proposed_income_params)

    respond_to do |format|
      if @proposed_income.save
        format.html { redirect_to @budget, notice: 'Proposed income was successfully created.' }
        format.json { render :show, status: :created, location: @proposed_income }
      else
        format.html { render :new }
        format.json { render json: @proposed_income.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposed_incomes/1
  # PATCH/PUT /proposed_incomes/1.json
  def update
    set_proposed_income

    respond_to do |format|
      if @proposed_income.update(proposed_income_params)
        format.html { redirect_to @budget, notice: 'Proposed income was successfully updated.' }
        format.json { render :show, status: :ok, location: @proposed_income }
      else
        format.html { render :edit }
        format.json { render json: @proposed_income.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposed_incomes/1
  # DELETE /proposed_incomes/1.json
  def destroy
    set_proposed_income
    calculate_saving
    

    @proposed_income.destroy
    respond_to do |format|
      format.html { redirect_to @budget, notice: 'Proposed income was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposed_income
      @budget = Budget.find(params[:budget_id])
      @proposed_income = @budget.proposed_incomes.find(params[:id])
      # @proposed_income = ProposedIncome.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposed_income_params
      params.require(:proposed_income).permit(:source, :comment, :amount, :budget_id)
    end

    def calculate_income
      budget = Budget.find(params[:budget_id])
      if (budget.income - @proposed_income.amount < 0)
        income = 0
      else
        income = budget.income - @proposed_income.amount
      end
      budget.update(income: income)
    end

    def calculate_saving
      calculate_income
      budget = Budget.find(params[:budget_id])
      saving = budget.income.to_f - budget.spending
      budget.update(saving: saving)   
    end
end
