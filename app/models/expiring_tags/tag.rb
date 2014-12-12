class ExpiringTags::Tag < ActiveRecord::Base
  has_many :taggings, class_name: 'ExpiringTags::Tagging', dependent: :destroy

  validates :tag, presence: true
end