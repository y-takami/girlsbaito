class Girl::ContactsController < Girl::Base
  skip_before_action :authorize

  def new
    if current_girl
      @contact = Contact.new(mail: current_girl.email, name: current_girl.name)
    else
      @contact = Contact.new
    end
  end

  def create
    @contact = Contact.new(contact_params)
    ActiveRecord::Base.transaction do

      if @contact.save
        flash.notice ='お問い合わせ内容を送信しました。ご回答は一週間以内に行わせて頂きますので，もうしばらくお待ち下さい。'
        redirect_to :girl_questions

      else
        render action: 'new'
      end
    end

  end

  private
  def contact_params
    params.require(:contact).permit(
      :belong, :name, :name_kana, :company_name, :company_name_kana, :mail,
      :tel, :homepage, :category, :content, :comfirm, :policy
    )
  end


end
