class LandingController < ApplicationController
  def index
    @proxy = ObtainProxyService.get
    @links = ObtainTargetWeiboLinksService.get
  end
end
