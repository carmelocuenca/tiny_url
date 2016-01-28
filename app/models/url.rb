class Url < ActiveRecord::Base
  has_one :link
  attr_reader :custom

  def self.create_link( original, custom = nil )
    url = Url.create( original: original )

    identifier = custom.blank? || !Link.where(identifier: custom).empty? ?
      url.id.to_s(36) : custom

    if Link.where(identifier: identifier).empty?
      Link.create( identifier: identifier, url: url)
    else
      url.destroy
      create_link( original )
    end
  end
end