module ExpiringTags::ActiveRecord
  def self.included(base)
    base.extend ExpiringTags::ActiveRecord::ClassMethods
  end

  def tag_names
    @tag_names ||= ExpiringTags::TagNames.new self
  end

  def tag_names=(names)
    if names.is_a?(ExpiringTags::TagNames)
      @tag_names = names
    else
      # convert the array of strings to a TagNames object
      @tag_names = ExpiringTags::TagNames.new_with_names self, names
    end
  end

  module ClassMethods
    def has_many_tags
      has_many :taggings, class_name: 'ExpiringTags::Tagging', as: :taggable, dependent: :destroy
      has_many :tags, class_name: 'ExpiringTags::Tag', through: :taggings
    end
  end
end