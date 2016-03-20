# Uncomment this line to define a global platform for your project
platform :ios, '8.0'
# Uncomment this line if you're using Swift
use_frameworks!

target 'ikaten' do
  pod 'Alamofire'
  pod 'KeychainAccess'
  pod 'SVProgressHUD'
end

def testing_pods
  pod 'Quick', '~> 0.9.0'
  pod 'Nimble', '3.0.0'
end

target 'ikatenTests' do
  testing_pods
end

target 'ikatenUITests' do
  testing_pods
end
