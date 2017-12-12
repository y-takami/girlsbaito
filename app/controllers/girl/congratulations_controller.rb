class Girl::CongratulationsController < Girl::Base

  def new
    @apply = Apply.find(params[:apply_id])
    @congratulation = Congratulation.new(email: @apply.girl.email, name: @apply.girl.name)
  end

  def create
    @apply = Apply.find(params[:apply_id])
    @congratulation = Congratulation.new(congratulation_params)
    @congratulation.apply_id = @apply.id
    @girl = current_girl
    girl_congratulation_params = congratulation_params
    girl_congratulation_params.delete("apply_id")
    girl_congratulation_params.delete("interview")
    girl_congratulation_params.delete("first_work_day")
    girl_congratulation_params.delete("first_work_flag")
    girl_congratulation_params.delete("note")

    girl_congratulation_params.delete("policy")

    ActiveRecord::Base.transaction do

      if @congratulation.save && @girl.update(girl_congratulation_params)
      flash.notice ='お祝い金申請が完了しました。審査を行いますので，完了までもうしばらくお待ち下さい。
      審査が完了しましたら，メールにてお知らせ申し上げます。'
      CongratulationRequestMailWorker.perform_async(@apply.id)
      redirect_to :girl_applies


      else
      render action: 'new'

      end
    end
    
  end

  private
  def congratulation_params
    params.require(:congratulation).permit(
      :apply_id, :first_work_flag, :method, :postal_first, :postal_last, :prefecture,
      :city, :house_number, :name, :name_sei_kana, :name_mei_kana, :bank_name,
      :bank_branch_name, :bank_type, :bank_number, :email, :tel, :interview, :first_work_day,
      :note, :policy
    )
  end


end
