class TouristGuide::Cli
  def call
    puts "                                                         ✰✰✰✰✰"
    puts "                                      ✰✰✰✰✰     ✰✰✰✰✰     ✰✰✰✰✰     ✰✰✰✰✰"
    puts "                              ✰✰✰✰✰     WELCOME TO THE TOURIST'S ERBIL GUIDE version #{TouristGuide::VERSION}    ✰✰✰✰✰"
    puts "                                      ✰✰✰✰✰     ✰✰✰✰✰     ✰✰✰✰✰     ✰✰✰✰✰"
    puts "                                            ✰✰✰✰✰     ✰✰✰✰✰     ✰✰✰✰✰"
    puts "                                                   ✰✰✰✰✰     ✰✰✰✰✰"
    # puts "                                                         ✰✰✰✰✰"
list
user_insert
end

def list
  puts ""
  puts "choose your destination:"
  puts "----------------------------------------------------------------------------------------------------------------------"
  puts "1. Hotels   ♡ ♡ ♡ ♡ ♡   2. Restaurants   ♡ ♡ ♡ ♡ ♡   3. Cafeterias   ♡ ♡ ♡ ♡ ♡   4. Parks   ♡ ♡ ♡ ♡ ♡   5. Malls"
  puts ""
  puts "                   ♡ ♡ ♡ ♡ ♡   6. Back to the main menu    ♡ ♡ ♡ ♡ ♡   7. Exit    ♡ ♡ ♡ ♡ ♡   "
end
      # puts "2. Restaurants"
      # puts ""
      # puts "3. Cafeterias"
      # puts ""
      # puts "4. Parks"
      # puts ""
      # puts "5. Malls"
      # puts ""
      # puts "6. Back to the main menu"
      # puts ""
      # puts "7. Exit"
  def user_insert
    input = nil
    input = gets.strip
    directions(input)
  end

  def directions(num)
    if num == "1"
      puts "ERBIL'S HOTELS LIST:"
      puts ""
      run("Hotels")
      list
      user_insert
    elsif num == "2"
      puts "ERBIL'S RESTAURANTS LIST:"
      puts ""
      run("Restaurants")
      list
      user_insert
    elsif num == "3"
      puts "ERBIL'S CAFETERIES LIST:"
      puts ""
      run("coffee%20shops")
      list
      user_insert
    elsif num == "4"
      puts "ERBIL'S PARKS LIST:"
      puts ""
      run("Parks")
      list
      user_insert
    elsif num == "5"
      puts "ERBIL'S MALLS LIST:"
      puts ""
      run("Malls")
      list
      user_insert
    elsif   num == "6"
      call
    elsif num == "7"
      puts "THANK YOU! HAVE A NICE TIME!"
    else
      puts "NOT valid, please insert the right number!!!"
      list
      user_insert # recursion
    end
end

  def run(direction)
    create_directions(direction)
    display_directions
  end

  def create_directions(name)
    scraping = TouristGuide::Scraping.new
    dir_attr = scraping.page_scraping(name)
    TouristGuide::Tour.create_from_collection(dir_attr)
  end

  def display_directions
    TouristGuide::Tour.all.each do |direction|
      puts "Name: #{direction.name.ljust(40," ")}    Address: #{direction.address.ljust(20," ")}   Description: #{direction.description.ljust(10," ")}"
      end
  end

end

# Where it's defined (whether it has self.)
# What it is called upon -- If a method is called upon an instance, it is an instance method. If it is called upon a class, it is a class method.
