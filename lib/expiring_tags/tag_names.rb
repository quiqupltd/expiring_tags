class ExpiringTags::TagNames

  include Enumerable

  def initialize(taggable)
    @taggable = taggable
  end

  def to_a
    taggable.tags.map(&:name)
  end

  def <<(name)
    taggable.tags << ExpiringTags::Tag.find_or_create_by(name: name)
  end

  def self.new_with_names(taggable, names)
    tag_names = new(taggable)
    tag_names.clear
    names.each { |name| tag_names << name }
    tag_names
  end

  def clear
    taggable.tags.clear
  end

  def each(&block)
    to_a.each &block
  end

  def delete(name)
    taggable.tags.delete ExpiringTags::Tag.find_by_name(name)
  end

  def +(array)
    array.each { |name| self.<< name }
    self
  end

  def -(array)
    array.each { |name| self.delete name }
    self
  end

  private

  attr_reader :taggable
end