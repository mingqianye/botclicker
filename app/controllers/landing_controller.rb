class LandingController < ApplicationController
  def index
    @proxy = ObtainProxyService.get
    @links = ObtainTargetWeiboLinksService.get
    ClickWeiboLinksService.run(@proxy)
  end
end
