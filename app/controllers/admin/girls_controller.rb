class Admin::GirlsController < Admin::Base

  def index
    @girls = Girl.all.page(params[:page])
  end


end
