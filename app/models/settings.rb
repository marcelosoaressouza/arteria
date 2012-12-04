class Settings < Settingslogic
  source "#{Rails.root}/config/arteria.yml"
  namespace Rails.env
end
