#
# Be sure to run `pod lib lint Easyder.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Easyder'
  s.version          = '0.1.2'
  s.summary          = '提高项目开发效率的工具包'
  s.homepage         = 'https://github.com/yanshuimu/Easyder'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yanshuimu' => '593692553@qq.com' }
  s.source           = { :git => 'https://github.com/yanshuimu/Easyder.git', :tag => "#{s.version}" }
  s.ios.deployment_target = '9.0'
  s.source_files = 'Easyder/Classes/**/*'
  s.dependency 'MJRefresh'
  s.dependency 'MBProgressHUD'
  s.dependency 'SDCycleScrollView'
  s.dependency 'FDFullscreenPopGesture'
end
