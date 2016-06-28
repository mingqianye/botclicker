class ClickWeiboLinksService
  def initialize
  end

  def start
    puts "======= Starting at #{DateTime.now} ========="
    with_retries(max_tries: 3) do
      run
    end
    puts "======= Exiting at #{DateTime.now} ========="
  end

  private
  def run
    browser = ObtainBrowserService.get
    begin
      #browser.goto('https://passport.weibo.cn/signin/login?entry=mweibo')
      browser.goto('http://requestb.in/ynsnszyn')
      browser.screenshot.save 'screenshot.png'
      puts 'done'

    rescue Exception => e
      puts "Oops, something is wrong!"
      puts e.backtrace
    ensure
      browser.close
    end
  end
end
