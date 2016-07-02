class ObtainBrowserService
  class << self
    def get
      puts 'Trying to get a browser...'
      browser = try_get_browser
      WaitForNewIpService.wait(browser)
      browser
    end

    private
    def try_get_browser_firefox
      #proxy = ObtainProxyService.get
      proxy = ProxyConfig.new(Settings.pi_proxy)
      puts "Using proxy: #{proxy.ip_port}"
      profile = Selenium::WebDriver::Firefox::Profile.new
      profile.proxy = Selenium::WebDriver::Proxy.new :http => proxy.ip_port, :ssl => proxy.ip_port
      Watir::Browser.new :firefox, :profile => profile
    end

    def try_get_browser
      #proxy = ObtainProxyService.get
      #proxy = ProxyConfig.new(Settings.tor_proxy)
      proxy = ProxyConfig.new(Settings.pi_proxy)
      puts "Using proxy: #{proxy.ip_port}"
      capabilities = Selenium::WebDriver::Remote::Capabilities.phantomjs(PhantomjsConfigService.get(proxy))
      driver = Selenium::WebDriver.for :phantomjs, :desired_capabilities => capabilities
      Watir::Browser.new driver
    end
  end
end
