class Admin::AppliesController < Admin::Base

  def index
    @applies = Apply.all.includes(:congratulation).order("congratulations.created_at desc, congratulations.examine").page(params[:page])
  end


end
