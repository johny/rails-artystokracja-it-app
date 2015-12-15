class Quote < ActiveRecord::Base

  ## Validations
  validates :content, presence: true, length: { minimum: 10, maximum: 1000}

  ## Scopes

  scope :published, -> { where(published: true) }

  ## Class methods

  def self.random
    self.published.limit(1).order("RAND()")
  end


end
