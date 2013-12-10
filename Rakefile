# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

require 'bubble-wrap/all'
require 'motion-cocoapods'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'ParseGeoMotion'
  # Parse SDK
  app.vendor_project('vendor/Pods/Parse-iOS-SDK/Parse.framework',
                      :static,
                      :products => ['Parse'],
                      :headers_dir => 'Headers')
  app.frameworks += %w(AudioToolbox CFNetwork MobileCoreServices QuartzCore Security StoreKit SystemConfiguration)
  app.libs += %W(/usr/lib/libz.dylib /usr/lib/libsqlite3.dylib)
  app.pods do
    pod 'Parse-iOS-SDK'
  end
end
