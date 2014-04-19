#import <UIKit/UIKit.h>

//IPC 
@interface CPDistributedMessagingCenter
+ (id)centerNamed:(id)arg1;
- (BOOL)sendMessageName:(id)arg1 userInfo:(id)arg2;
- (void)runServerOnCurrentThread;
- (void)registerForMessageName:(id)arg1 target:(id)arg2 selector:(SEL)arg3;
- (id)sendMessageAndReceiveReplyName:(id)arg1 userInfo:(id)arg2;
@end


//Message Handler
%hook SBApplicationController
- (id)init{
	CPDistributedMessagingCenter *
		center = [CPDistributedMessagingCenter centerNamed:@"ic.nuts.disablenc.server"];
	[center runServerOnCurrentThread];
	[center registerForMessageName:@"ic.nuts.currentIdentifier" target:self selector:@selector(siriInvoker)];
	return %orig;
}
%new(v@:@@)
- (void)siriInvoker{
	[[UIApplication sharedApplication] activateAssistantWithOptions:nil withCompletion:nil];
}
%end
