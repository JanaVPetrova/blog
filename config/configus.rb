Configus.build Rails.env do
  env :development do
    pagination do
      default 10
    end

    owner do
      login "owner"
      password "owner"
      email "owner@mail.com"
    end

    mailer do
      from "noreply@example.com"
      host "example.com"
    end
  end

  env :test, parent: :development
  env :production, parent: :development
end