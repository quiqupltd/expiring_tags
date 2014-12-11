Rails.application.routes.draw do
  mount ExpiringTags::Engine => "/expiring_tags"
end
