class Girl::ShopSearchForm

  include ActiveModel::Model

  attr_accessor :category, :city, :feature, :payment_hour, :prefecture

  def search
    rel = ShopShow
    rel2 = Feature
    rel = rel.joins(:prefecture)
    rel = rel.joins(:city)
    rel = rel.joins(:category)
    if prefecture
      rel = rel.where('prefectures.id' => prefecture)
    end
    if city
      city.each do |f|
        unless f=="0"
          rel = rel.where('cities.name' => city)
        end
      end
    end
    if category
      category.each do |f|
        unless f=="0"
          rel = rel.where('categories.name' => category)
        end
      end
    end

    feature_array = Array.new
    if feature
      unless feature == []
        unless feature.delete("0")=="0"

          feature.count.times do |n|
            rel2 = rel2.where(feature[n] => true)
          end
          unless rel2.order(:id).count==0
            rel2.order(:id)
            rel2.each do |f|
              feature_array.push(f.shop_show_id)
            end
            rel = rel.where(id: feature_array)
          end
        end
      end
    end

    if payment_hour
      rel = rel.where('payment_hour_low >= ?', payment_hour)
    end

    rel.where(examine: true).order(:shop_point)


  end

end