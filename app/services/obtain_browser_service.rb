class ObtainBrowserService
  class << self
    def get
      puts 'Trying to get a browser...'
      browser = try_get_browser
      browser.goto(Settings.ip_info_url)
      puts "Ip info: #{JSON.parse(browser.body.text)}"
      browser
    end

    private
    def try_get_browser
      proxy = ObtainProxyService.get
      puts "trying proxy: #{proxy.ip_port}"
      profile = Selenium::WebDriver::Firefox::Profile.new
      profile.proxy = Selenium::WebDriver::Proxy.new :http => proxy.ip_port, :ssl => proxy.ip_port
      Watir::Browser.new :firefox, :profile => profile
    end
  end
end
