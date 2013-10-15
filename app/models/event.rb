class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  def self.top_rated_upcoming(limit = 10)
    where("held_at IS NULL").order("rate DESC").limit(limit).to_a
  end

  def interested!
    increment!(:rate)
  end
end

