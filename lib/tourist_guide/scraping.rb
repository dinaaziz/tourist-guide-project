class TouristGuide::Scraping
  def page_scraping(direction_name)
    scraped_directions =[]
    direction_name = direction_name.downcase
   html = open("https://iq.brate.com/en/search?q=#{direction_name}&region=8&sort=2&page=1")
    scraped_page = Nokogiri::HTML(html)
    array = scraped_page.css("div.single-search-result") # selector
    array.each do |category|
      # binding.pry
      # category.css("div.b-main-center").each do |element|     #site
        # if element.css("div.b-main-center").length > 0  #site
        place = {}
        name = category.css(".search-result-title h3").text.strip
        address = category.css(".source a.b-link").text.strip
        description = category.css(".search-result-title div.search-result-business-category").text.strip
        place[:name] = name
        place[:address] = address
        place[:description] = description

        scraped_directions << place
    end
    return scraped_directions
 end
end
