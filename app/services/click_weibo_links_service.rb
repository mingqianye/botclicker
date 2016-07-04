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
    browser = ObtainBrowserService.new.try_get_browser
    ObtainTargetLinksService.get.shuffle.each do |link|
      puts "Visiting #{link}"
      browser.goto(link)
      Watir::Wait.until(240) { browser.title.present? }
      puts "Page title: #{browser.title}"
      browser.screenshot.save "screenshots/#{DateTime.now}.png"
      puts 'done'
    end
    browser.close
  end
end
