class Movie < ActiveRecord::Base
  def self.all_ratings
    ['G', 'PG', 'PG-13', 'R']
  end

  def self.with_ratings(ratings_list)
    if ratings_list.present?
      where('LOWER(rating) IN (?)', ratings_list.map(&:downcase))
    else
      all
    end
  end
end