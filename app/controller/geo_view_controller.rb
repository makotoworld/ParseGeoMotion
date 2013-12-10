class GeoViewController < UIViewController
  include BW::KVO

  def viewDidLoad
    super
    self.view.backgroundColor = UIColor.whiteColor

    @lat_label = UILabel.new
    @lat_label.text = 'lat:'
    @lat_label.frame = [[10, 40], [200, 20]]

    @lng_label = UILabel.new
    @lng_label.text = 'lng:'
    @lng_label.frame = [[10, 60], [200, 20]]

    @start = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @start.frame = [[10, 300], [50, 30]]
    @start.setTitle('start', forState:UIControlStateNormal)
    @start.when UIControlEventTouchUpInside do
      addLocation
    end

    @stop = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @stop.frame = [[50, 300], [50, 30]]
    @stop.setTitle('stop', forState:UIControlStateNormal)
    @stop.when UIControlEventTouchUpInside do
      delLocation
    end

    self.view.addSubview(@lat_label)
    self.view.addSubview(@lng_label)
    self.view.addSubview(@start)
    self.view.addSubview(@stop)

    # ロケーションマネージャの初期設定
    @location_manager ||= CLLocationManager.alloc.init.tap do |lm|
      lm.desiredAccuracy = KCLLocationAccuracyBest
      lm.distanceFilter = 10
      lm.startMonitoringSignificantLocationChanges
      lm.delegate = self
    end

  end

  # 座標の記録を開始
  def addLocation
    coordinate = @location_manager.location.coordinate
    latitude = coordinate.latitude
    longitude = coordinate.longitude
    @lat_label.text = 'lat: ' + latitude.to_s
    @lng_label.text = 'lng: ' + longitude.to_s
    geoSave(latitude.to_s, longitude.to_s)
  end

  # 座標の記録を停止
  def delLocation
    @location_manager.stopMonitoringSignificantLocationChanges
    @lat_label.text = 'lat: '
    @lng_label.text = 'lng: '
  end

  def geoSave(lat, lng)
    geoData = PFObject.objectWithClassName("GeoData")
    point = PFGeoPoint.geoPointWithLatitude(lat, longitude:lng)
    geoData["addData"] = NSDate.date.to_s
    geoData["point"] = point
    geoData.saveInBackground
  end

end
