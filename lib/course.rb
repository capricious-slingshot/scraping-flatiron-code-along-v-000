class Course
  @@all = []
  attr_accessor :title, :schedule, :description

  def initialize(title, schedule, description)
    @title = title
    @schedule = schedule
    @description = description

    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end
end
