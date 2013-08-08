Configus.build Rails.env do
  env :development do
    pagination do
      default 10
    end

    owner do
      login "owner"
      password "owner"
    end
  end

  env :test, parent: :development
end