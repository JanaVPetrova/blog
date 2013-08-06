Configus.build Rails.env do
  env :development do
    pagination do
      default 10
    end
  end

  env :test, parent: :development
end