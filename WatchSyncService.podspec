Pod::Spec.new do |s|
    s.name        = "WatchSyncService"
    s.version     = "1.0.3"
    s.summary     = "WatchSyncService"
    s.homepage    = "https://github.com/AntonBelousov/WatchSyncService"
    s.license     = { :type => "MIT" }
    s.authors     = { "AntonBelousov" => "xxx@yyy.com" }

    s.requires_arc = true
    s.ios.deployment_target = "13.0"
    s.watchos.deployment_target = "8.0"
    s.swift_version = '5.0'

    s.source   = { :git => "https://github.com/AntonBelousov/WatchSyncService.git", :tag => s.version }
    s.source_files = "Source/*.swift"
end
