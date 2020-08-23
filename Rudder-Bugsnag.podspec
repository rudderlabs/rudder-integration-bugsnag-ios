Pod::Spec.new do |s|
  s.name             = 'Rudder-Bugsnag'
  s.version          = '1.0.0'
  s.summary          = 'Privacy and Security focused Segment-alternative. Firebase Native SDK integration support.'

  s.description      = <<-DESC
  Rudder is a platform for collecting, storing and routing customer event data to dozens of tools. Rudder is open-source, can run in your cloud environment (AWS, GCP, Azure or even your data-centre) and provides a powerful transformation framework to process your event data on the fly.
                       DESC

  s.homepage         = 'https://github.com/rudderlabs/rudder-integration-bugsnag-ios'
  s.license          = { :type => 'Apache', :file => 'LICENSE' }
  s.author           = {'RudderStack' => 'arnab@rudderlabs.com'}
  s.source           = { :git => 'https://github.com/rudderlabs/rudder-integration-bugsnag-ios.git', :tag => 'v1.0.0' }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Rudder-Bugsnag/Classes/**/*'

  s.dependency 'Rudder'
  s.dependency 'Bugsnag', '~> 5.0'
end
