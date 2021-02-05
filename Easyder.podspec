Pod::Spec.new do |s|
  s.name             = 'Easyder'
  s.version          = '0.2.7'
  s.summary          = 'Classes that improve development efficiency and simplify the project framework'
  s.homepage         = 'https://github.com/yanshuimu/Easyder'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yanshuimu' => '593692553@qq.com' }
  s.source           = { :git => 'https://github.com/yanshuimu/Easyder.git', :tag => "#{s.version}" }
  s.ios.deployment_target = '9.0'
  s.source_files = 'Easyder/Easyder.h'
  s.resource = 'Easyder/Resources/*.{png,bundle}'
  
  s.subspec 'Extension' do |ss|
      ss.source_files = 'Easyder/Extension/*.{h,m}'
  end
  
  s.subspec 'Utils' do |ss|
      ss.source_files = 'Easyder/Utils/*.{h,m}'
  end
  
  s.subspec 'Config' do |ss|
      ss.source_files = 'Easyder/Config/*.{h,m}'
  end
  
  s.subspec 'Network' do |ss|
      ss.source_files = 'Easyder/Network/*.{h,m}'
  end
  
  s.subspec 'Lib' do |ss|
      ss.subspec 'LYEmptyView' do |sss|
          sss.source_files = 'Easyder/Lib/LYEmptyView/*.{h,m}'
      end
      ss.subspec 'CountingLabel' do |sss|
          sss.source_files = 'Easyder/Lib/CountingLabel/*.{h,m}'
      end
      ss.subspec 'HGTimerButton' do |sss|
          sss.source_files = 'Easyder/Lib/HGTimerButton/*.{h,m}'
      end
      ss.subspec 'GHConsole' do |sss|
          sss.source_files = 'Easyder/Lib/GHConsole/*.{h,m}'
          sss.resource = 'Easyder/Lib/GHConsole/*.{png,bundle}'
      end
  end
  
  s.subspec 'Base' do |ss|
      ss.dependency 'Easyder/Extension'
      ss.dependency 'Easyder/Utils'
      ss.dependency 'Easyder/Config'
      ss.dependency 'Easyder/Lib'
      ss.dependency 'Easyder/Network'
      
      ss.source_files = 'Easyder/Base/*.{h,m}'
  end
  
  s.dependency 'MJRefresh'
  s.dependency 'MBProgressHUD'
  s.dependency 'SDCycleScrollView'
  s.dependency 'FDFullscreenPopGesture'
  s.dependency 'UICKeyChainStore'
  s.dependency 'AFNetworking'
  s.dependency 'MJExtension'
end
