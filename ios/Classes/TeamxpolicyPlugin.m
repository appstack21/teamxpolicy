#import "TeamxpolicyPlugin.h"
#if __has_include(<teamxpolicy/teamxpolicy-Swift.h>)
#import <teamxpolicy/teamxpolicy-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "teamxpolicy-Swift.h"
#endif

@implementation TeamxpolicyPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTeamxpolicyPlugin registerWithRegistrar:registrar];
}
@end
