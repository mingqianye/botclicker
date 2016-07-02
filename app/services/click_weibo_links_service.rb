class ClickWeiboLinksService
  def initialize
  end

  def start
    puts "======= Starting at #{DateTime.now} ========="
    run
    puts "======= Exiting at #{DateTime.now} ========="
  end

  private
  def run
    browser = ObtainBrowserService.get
    ObtainTargetLinksService.get.each do |link|
      puts "Visiting #{link}"
      browser.goto(link)
      puts "Page title: #{browser.title}"
      browser.screenshot.save "screenshots/#{DateTime.now}.png"
      puts 'done'
    end
    browser.close
  end
end
