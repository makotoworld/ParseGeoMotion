class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    Parse.setApplicationId("aaa",
                            clientKey:"aaa")
    true
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds).tap do |w|
      geo_view_controller = GeoViewController.new
      w.rootViewController = geo_view_controller
      w.makeKeyAndVisible
    end
  end
end
