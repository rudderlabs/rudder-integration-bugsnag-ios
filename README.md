# What is Rudder?

**Short answer:**
Rudder is an open-source Segment alternative written in Go, built for the enterprise. .

**Long answer:**
Rudder is a platform for collecting, storing and routing customer event data to dozens of tools. Rudder is open-source, can run in your cloud environment (AWS, GCP, Azure or even your data-centre) and provides a powerful transformation framework to process your event data on the fly.

Released under [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)

## Getting Started with Bugsnag Integration of iOS SDK
1. Add [Bugnsag](https://www.bugsnag.com/) as a destination in the [Dashboard](https://app.rudderstack.com/) and define `apiKey`.


3. Rudder-Bugsnag is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Rudder-Bugsnag'
```

## Initialize ```RudderClient```
Put this code in your ```AppDelegate.m``` file under the method ```didFinishLaunchingWithOptions```
```
RSConfigBuilder *builder = [[RSConfigBuilder alloc] init];
[builder withDataPlaneUrl:<YOUR_DATA_PLANE_URL>];
[builder withFactory:[RudderBugsnagFactory instance]];
[RSClient getInstance:<YOUR_WRITE_KEY> config:[builder build]];
```

## Send Events
Follow the steps from [Rudder iOS SDK](https://github.com/rudderlabs/rudder-sdk-ios)

## Contact Us
If you come across any issues while configuring or using RudderStack, please feel free to [contact us](https://rudderstack.com/contact/) or start a conversation on our [Discord](https://discordapp.com/invite/xNEdEGw) channel. We will be happy to help you.
