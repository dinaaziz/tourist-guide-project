class TouristGuide::Scraping
  HOME_PAGE= "https://iq.brate.com"

  def scrape_index_page(direction_name)
    scraped_directions =[]
    html = open("#{HOME_PAGE}/brate #{direction_name}")
    scraped_page = Nokogiri::HTML(html)
    array = scraped_page.css("div.single-search-result")
    array.each do |category|
      category.css("body").each do |element|     #site
        if element.css("div.b-main-center").length > 0  #site
        place = {}
        name = element.css(".search-result-title h3").text.gsub(/\s/,"")
        address = element.css(".source a.b-link").text.gsub(/\s/,"")
        description = element.css(".search-result-title div.search-result-business-category").text.gsub(/\s/,"")

        place[:name] = name
        place[:address] = address
        place[:description] = description

        scraped_directions << place
    end
      end
    end
    return scraped_directions
  end

end
