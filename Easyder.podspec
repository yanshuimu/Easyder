#
# Be sure to run `pod lib lint Easyder.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Easyder'
  s.version          = '0.1.4'
  s.summary          = '提高项目开发效率的工具包'
  s.homepage         = 'https://github.com/yanshuimu/Easyder'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yanshuimu' => '593692553@qq.com' }
  s.source           = { :git => 'https://github.com/yanshuimu/Easyder.git', :tag => "#{s.version}" }
  s.ios.deployment_target = '9.0'
  s.source_files = 'Easyder/Classes/*.{h,m}'
  
  s.subspec 'Resources' do |ss|
      ss.source_files = ''
  end
  
  s.subspec 'Base' do |ss|
      ss.source_files = 'Easyder/Classes/Base/*.{h,m}'
  end
  
  s.subspec 'Extension' do |ss|
      ss.source_files = 'Easyder/Classes/Extension/*.{h,m}'
  end
  
  s.subspec 'Utils' do |ss|
      ss.source_files = 'Easyder/Classes/Utils/*.{h,m}'
  end
  
  s.subspec 'Config' do |ss|
      ss.source_files = 'Easyder/Classes/Config/*.{h,m}'
  end
  
  s.subspec 'Lib' do |ss|
      ss.subspec 'LYEmptyView' do |sss|
          sss.source_files = 'Easyder/Classes/Lib/LYEmptyView/*.{h,m}'
      end
  end
  
  s.dependency 'MJRefresh'
  s.dependency 'MBProgressHUD'
  s.dependency 'SDCycleScrollView'
  s.dependency 'FDFullscreenPopGesture'
  s.dependency 'UICKeyChainStore'
end
