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
      puts "Using proxy: #{proxy.ip_port}"
      capabilities = Selenium::WebDriver::Remote::Capabilities.phantomjs(PhantomjsConfigService.get(proxy))
      driver = Selenium::WebDriver.for :phantomjs, :desired_capabilities => capabilities
      browser = ::Watir::Browser.new driver
    end
  end
end
