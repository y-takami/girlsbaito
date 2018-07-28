class Girl::TopController < Girl::Base
  skip_before_action :authenticate_girl!

  def index
  end

  def favorite_add
    if cookies[:favorite]
      cookies.permanent[:favorite] += " #{params[:shop_id]}"
      cookies.permanent[:favorite] = cookies.permanent[:favorite].split(" ").uniq
      cookies.permanent[:favorite] = cookies.permanent[:favorite].join(" ")
      if current_girl
        favorite = cookies[:favorite]
        if current_girl.favorite != nil
          favorite = current_girl.favorite + " " + favorite
        end
        favorite = favorite.split(" ").uniq
        favorite = favorite.join(" ")
        current_girl.favorite = favorite
        current_girl.save
      end
    else
      cookies.permanent[:favorite] = " #{params[:shop_id]}"
      if current_girl
        current_girl.favorite = " #{params[:shop_id]}"
        current_girl.save
      end
    end
    flash.notice ='気になるリストに登録しました。'
    redirect_to girl_shop_path(params[:shop_id])
  end


  def favorite_delete
    favorite = cookies.permanent[:favorite].split(" ")
    favorite.delete(params[:shop_id].to_s)
    cookies.permanent[:favorite] = favorite.join(" ")
    if current_girl
      favorite = current_girl.favorite.split(" ")
      favorite.delete(params[:shop_id].to_s)
      current_girl.favorite = favorite.join(" ")
      current_girl.save
    end
    flash.notice ='気になるリストを解除しました。'
    redirect_to girl_shop_path(params[:shop_id])
  end

  def intro
    cookies[:invitation] = {value: params[:code], expires: 60.day.from_now}
    @girl = Girl.find_by(invitation_code: cookies[:invitation])
    if @girl
      invitation_num = @girl.invitation_num
      invitation_num = invitation_num+1
      @girl.update(invitation_num: invitation_num)
    end
    redirect_to girl_root_path
  end

  def payment_search
    @search_form = Girl::ShopSearchForm.new(params[:search])
    @shops = @search_form.search.page(params[:page])
  end

  def history
    if current_girl
      if current_girl.history
        history = current_girl.history.split(" ")

        @shops = ShopShow.find(history)
        @shops_count = @shops.count
      end

    elsif cookies[:history]
      history = cookies[:history].split(" ")
      @shops = ShopShow.find(history)
      @shops_count = @shops.count
    else

    end

    if @shops_count.nil?
      @shops_count = 0
    end

  end


  def favorite
    if current_girl
      if current_girl.favorite
        favorite = current_girl.favorite.split(" ")
        @shops = ShopShow.find(favorite)
        @shops_count = @shops.count

      end
    elsif cookies[:favorite]
      favorite = cookies[:favorite].split(" ")
      @shops = ShopShow.find(favorite)
      @shops_count = @shops.count

    else

    end

    if @shops_count.nil?
      @shops_count = 0
    end

  end

  def job_category
  end

  def advertisement
  end

  def contact
  end

  def policy
  end

  def personal_info
  end

  def congra
  end

  def vision
  end




end
