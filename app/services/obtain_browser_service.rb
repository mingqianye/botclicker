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
      service_args = ["--proxy=#{proxy.ip_port}", '--proxy-type=http']
      capabilities = Selenium::WebDriver::Remote::Capabilities.phantomjs("phantomjs.page.settings.userAgent" => "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1468.0 Safari/537.36", 'phantomjs.page.customHeaders.Referer' => "http://weibo.com/u/2957260672?topnav=1&wvr=6&topsug=1&is_all=1", "phantomjs.cli.args" => service_args)
      #byebug
      driver = Selenium::WebDriver.for :phantomjs, :desired_capabilities => capabilities
      #switches = ["--proxy=#{proxy.ip_port}"]
      #browser = ::Watir::Browser.new(driver, args: switches)
      browser = ::Watir::Browser.new driver
      #profile = Selenium::WebDriver::Firefox::Profile.new
      #profile.proxy = Selenium::WebDriver::Proxy.new :http => proxy.ip_port, :ssl => proxy.ip_port
      #Watir::Browser.new :firefox, :profile => profile
    end
  end
end
