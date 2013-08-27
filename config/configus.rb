Configus.build Rails.env do
  credentials_hash = YAML.load(File.read("config/credentials.yml"))

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

    mail do
      username credentials_hash["gmail"]["username"]
      password credentials_hash["gmail"]["password"]
    end
  end

  env :test, parent: :development
end