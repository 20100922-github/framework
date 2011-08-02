class Tag < ActiveRecord::Base
  has_and_belongs_to_many :media
  after_save :delete

  def delete
    if (self.media.size == 0)
      logger.debug "blub"
    else
      logger.debug "bla"
    end
  end
end
