class DosesController < ApplicationController

  def new
     @dose = Dose.new
     @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new  # renders the new view
    end
  end


  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end



  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end



end
