require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

bugsnag_sdk_version = '~> 6.26'
rudder_sdk_version = '~> 1.12'

Pod::Spec.new do |s|
  s.name             = 'Rudder-Bugsnag'
  s.version          = package['version']
  s.summary          = 'Privacy and Security focused Segment-alternative. Firebase Native SDK integration support.'

  s.description      = <<-DESC
  Rudder is a platform for collecting, storing and routing customer event data to dozens of tools. Rudder is open-source, can run in your cloud environment (AWS, GCP, Azure or even your data-centre) and provides a powerful transformation framework to process your event data on the fly.
                       DESC

  s.homepage         = 'https://github.com/rudderlabs/rudder-integration-bugsnag-ios'
  s.license          = { :type => 'Apache', :file => 'LICENSE' }
  s.author           = {'RudderStack' => 'arnab@rudderstack.com'}
  s.source           = { :git => 'https://github.com/rudderlabs/rudder-integration-bugsnag-ios.git', :tag => "v#{s.version}" }

  s.ios.deployment_target = '9.0'
  s.source_files = 'Rudder-Bugsnag/Classes/**/*'

  if defined?($BugsnagSDKVersion)
      Pod::UI.puts "#{s.name}: Using user specified Bugsnag SDK version '#{$BugsnagSDKVersion}'"
      bugsnag_sdk_version = $BugsnagSDKVersion
  else
      Pod::UI.puts "#{s.name}: Using default Bugsnag SDK version '#{bugsnag_sdk_version}'"
  end
  
  if defined?($RudderSDKVersion)
      Pod::UI.puts "#{s.name}: Using user specified Rudder SDK version '#{$RudderSDKVersion}'"
      rudder_sdk_version = $RudderSDKVersion
  else
      Pod::UI.puts "#{s.name}: Using default Rudder SDK version '#{rudder_sdk_version}'"
  end
  
  s.dependency 'Rudder', rudder_sdk_version
  s.dependency 'Bugsnag', bugsnag_sdk_version
end
