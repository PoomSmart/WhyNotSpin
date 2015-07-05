#import "../PS.h"

BOOL noCancelUpdate;

%hook CydiaTabBarController

- (void)cancelUpdate
{
	if (noCancelUpdate)
		return;
	%orig;
}

%end

%hook Cydia

- (void)applicationWillResignActive:(UIApplication *)application
{
	noCancelUpdate = YES;
	%orig;
	noCancelUpdate = NO;
}

%end