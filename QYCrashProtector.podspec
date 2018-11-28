#
# Be sure to run `pod lib lint QYCrashProtector.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QYCrashProtector'
  s.version          = '1.0.3'
  s.summary          = 'app crash protector.'
  s.description      = 'Can effectively protect the App is not easy to crash.'
  s.homepage         = 'https://github.com/qiaoyoung/QYCrashProtector'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'joeyoung' => '393098486@qq.com' }
  s.source           = { :git => 'https://github.com/qiaoyoung/QYCrashProtector.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.requires_arc = true 
  s.public_header_files = 'QYCrashProtector/QYCrashProtector.h'
  s.source_files = 'QYCrashProtector/*'

  s.subspec 'QYUtils' do |sub|
    sub.source_files = 'QYCrashProtector/QYUtils/*.{h,m}'
  end

  s.subspec 'QYContainer' do |sub| 
    sub.source_files = 'QYCrashProtector/QYContainer/*.{h,m}'
    sub.dependency 'QYCrashProtector/QYUtils'
  end

end
