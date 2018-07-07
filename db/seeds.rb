table_names = %w(admins questions shop_infos shop_shows girls applies prefectures cities routes stations categories features congratulations invitations points)

table_names.each do |table_name|
  path = Rails.root.join('db', 'seeds', Rails.env, "#{table_name}.rb")
  if File.exist?(path)
    puts "Creating #{table_name}...."
    require(path)
  end
end