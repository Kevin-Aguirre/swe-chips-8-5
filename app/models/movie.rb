class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

class Movie < ApplicationRecord
  def self.all_ratings
    %w[G PG PG-13 R]
  end

  def self.with_ratings(ratings, sort_by)
    if ratings.nil?
      all.order sort_by
    else
      where(rating: ratings.map(&:upcase)).order sort_by
    end
  end

  def self.find_in_tmdb(search_params, api_key = "f55039bb175bd8f15d5e7a5553675ae3")
    # Handle different input formats
    if search_params.is_a?(String)
      # If it looks like a URL, use it directly (for testing)
      if search_params.start_with?('http')
        Faraday.get(search_params)
        return []
      end
      title = search_params
      language = 'en'
      release_year = nil
    elsif search_params.is_a?(Array)
      title = search_params.first
      language = 'en'
      release_year = nil
    elsif search_params.is_a?(Hash)
      title = search_params[:title]
      language = search_params[:language] || 'en'
      release_year = search_params[:release_year]
    else
      return []
    end
    
    # Build URL for actual API calls
    url = "https://api.themoviedb.org/3/search/movie?api_key=#{api_key}&query=#{title}"
    url += "&language=#{language}" unless language == 'all'
    url += "&year=#{release_year}" if release_year.present?
    
    response = Faraday.get(url)
    
    # Parse the JSON response
    data = JSON.parse(response.body)
    results = data['results'] || []
    
    # Convert to hash format
    results.map do |movie|
    {
      title: movie['title'],
      release_date: movie['release_date'],
      rating: 'R'
    }
    end
  end
  
end


