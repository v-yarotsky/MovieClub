class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  def self.top_proposed(limit = 10)
    where("scheduled_for IS NULL").order("rate DESC").limit(limit).to_a
  end

  def self.upcoming
    where("scheduled_for >= ?", Time.now).order("scheduled_for ASC").first
  end

  def interested!
    increment!(:rate)
  end
end
