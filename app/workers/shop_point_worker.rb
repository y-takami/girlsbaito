class ShopPointWorker
  include Sidekiq::Worker

  def perform
    @shops = ShopShow.all
    @shops.each do |f|
      employment_count = 0
      if f.applies
        f.applies.each do |g|
          if g.employment
            employment_count += 1 if g.employment==true
          end
        end
      end
      point_new = 1000 + employment_count*100 + f.congratulation_money/100 + f.applies.count*10
      f.shop_point = point_new
      f.save
    end
  end

end