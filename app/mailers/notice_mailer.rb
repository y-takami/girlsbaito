class NoticeMailer < ActionMailer::Base

  default from: "girlsbaito39@gmail.com"

  def register(girl)
    @girl = girl
    mail to: girl.email, subject: "登録が完了しました。"
  end

  def apply_girl(girl, shop)
    @girl = girl
    @shop = shop
    mail to: girl.email, subject: "応募が完了しました。"
  end

  def apply_shop(girl, shop)
    @girl = girl
    @shop = shop
    mail to: shop.shop_info.admin_email, subject: "応募がありました。"
  end

  def congratulation_request(apply)
    @apply = apply
    mail to: apply.girl.email, subject: "お祝い金申請が完了しました。"
  end

  def invitation_point(invitation)
    @invitation = invitation
    mail to: invitation.girl.email, subject: "換金申請が完了しました。"
  end

  def examine_congratulation(congratulation)
    @congratulation = congratulation
    mail to: congratulation.email, subject: "お祝い金申請が完了しました。"
  end

  def examine_invitation(invitation)
    @invitation = invitation
    mail to: invitation.email, subject: "招待ポイント換金申請が完了しました。"
  end

  def register_shop(shop)
    @shop = shop
    mail to: shop.admin_email, subject: "登録申請が完了しました。"
  end

  def examine_shop(shop)
    @shop = shop
    mail to: shop.admin_email, subject: "登録申請審査が完了しました。"
  end

  def examine_show(shop)
    @shop = shop
    mail to: shop.admin_email, subject: "求人情報掲載の審査が完了しました"
  end

end
