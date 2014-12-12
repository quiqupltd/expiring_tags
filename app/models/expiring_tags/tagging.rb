class ExpiringTags::Tagging < ActiveRecord::Base
  belongs_to :taggable, polymorphic: true
  belongs_to :tag, class_name: 'ExpiringTags::Tag'

  # validates :taggable, :tag, presence: true
end