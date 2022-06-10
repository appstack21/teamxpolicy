//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<path_provider_ios/FLTPathProviderPlugin.h>)
#import <path_provider_ios/FLTPathProviderPlugin.h>
#else
@import path_provider_ios;
#endif

#if __has_include(<pdf_viewer_plugin/PdfViewerPlugin.h>)
#import <pdf_viewer_plugin/PdfViewerPlugin.h>
#else
@import pdf_viewer_plugin;
#endif

#if __has_include(<teamxpolicy/TeamxpolicyPlugin.h>)
#import <teamxpolicy/TeamxpolicyPlugin.h>
#else
@import teamxpolicy;
#endif

#if __has_include(<teamxservice/TeamxservicePlugin.h>)
#import <teamxservice/TeamxservicePlugin.h>
#else
@import teamxservice;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [PdfViewerPlugin registerWithRegistrar:[registry registrarForPlugin:@"PdfViewerPlugin"]];
  [TeamxpolicyPlugin registerWithRegistrar:[registry registrarForPlugin:@"TeamxpolicyPlugin"]];
  [TeamxservicePlugin registerWithRegistrar:[registry registrarForPlugin:@"TeamxservicePlugin"]];
}

@end
