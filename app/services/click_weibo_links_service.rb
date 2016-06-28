class ClickWeiboLinksService
  def initialize
  end

  def start
    puts "======= Starting at #{DateTime.now} ========="
      browser = ObtainBrowserService.get
      begin
        #browser.goto('https://passport.weibo.cn/signin/login?entry=mweibo')
        browser.goto('http://98.234.187.151:3000/')
        puts 'done'

      rescue Exception => e
        puts "Oops, something is wrong!"
        puts e.backtrace
      ensure
        browser.close
      end

    puts "======= Exiting at #{DateTime.now} ========="
  end
end
