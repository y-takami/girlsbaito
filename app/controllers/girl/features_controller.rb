class Girl::FeaturesController < Girl::Base
  skip_before_action :authenticate_girl!

end
