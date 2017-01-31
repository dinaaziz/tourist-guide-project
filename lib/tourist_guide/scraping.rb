class TouristGuide::Scraping
  HOME_PAGE= "https://iq.brate.com"

  def page_scraping(direction_name)
    scraped_directions =[]
    direction_name = direction_name.downcase
   html = open("#{HOME_PAGE}/en/search?q=#{direction_name}&region=8&sort=2&page=1")
    scraped_page = Nokogiri::HTML(html)
    array = scraped_page.css("div.single-search-result")
    array.each do |category|
      # binding.pry
      # category.css("div.b-main-center").each do |element|     #site
        # if element.css("div.b-main-center").length > 0  #site
        place = {}
        name = category.css(".search-result-title h3").text.gsub(/\s/,"")
        address = category.css(".source a.b-link").text.gsub(/\s/,"")
        description = category.css(".search-result-title div.search-result-business-category").text.gsub(/\s/,"")
        place[:name] = name
        place[:address] = address
        place[:description] = description

        scraped_directions << place
    end
    return scraped_directions
end
end
