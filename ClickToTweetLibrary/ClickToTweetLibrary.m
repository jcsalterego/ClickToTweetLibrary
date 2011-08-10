//
//  ClickToTweetLibrary.m
//  ClickToTweetLibrary
//
//  Created by Jerry Chen on 8/8/11.
//  Copyright 2011 N/A. All rights reserved.
//

#import "ClickToTweetLibrary.h"

#define MENU_ITEM_LABEL @"Open With Tweet Library…"
#define SWIZZLE(class_name, src, dest) \
    [NSClassFromString(class_name) jr_swizzleMethod:@selector(src) \
    withMethod:@selector(dest) \
    error:NULL]

#ifdef DEVELOPMENT
#define STATUS_URL_FORMAT @"http://twitter.com/%@"
#else
#define STATUS_URL_FORMAT @"http://tweetlibrary.com/%@"
#endif

@implementation NSObject (ClickToTweetLibraryExtensions)

- (IBAction)didClickOpenWithTweetLibrary:(id)sender
{
    id selected =
        [[[[[[NSApplication sharedApplication] delegate] rootViewController]
            columnViewController] topViewController] selectedStatus];
    if (selected) {
        NSLog(@"selected = %@", selected);
        NSString *fullURLString =
            [[NSString stringWithFormat:STATUS_URL_FORMAT, [selected statusID]] retain];
        [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:fullURLString]];
        [fullURLString release];
    }
}

- (void)CTTL__setSelected:(BOOL)isSelected animated:(BOOL)isAnimated
{
    if (isSelected) {
        /* if any tweet is selected, activate menu item */
        [[[[[[NSApplication sharedApplication] menu]
            itemWithTitle:@"Tweet"] submenu]
          itemAtIndex:14]
         setAction:@selector(didClickOpenWithTweetLibrary:)];
    }
    [self CTTL__setSelected:isSelected animated:isAnimated];
}

@end

@implementation ClickToTweetLibrary

/**
 * A special method called by SIMBL once the application has started and all classes are initialized.
 */
+ (void) load
{
    NSMenuItem *tweetMenuItem =
        [[[NSApplication sharedApplication] menu] itemWithTitle:@"Tweet"];
    NSMenu *tweetSubMenu = [tweetMenuItem submenu];
    NSMenuItem *openWithTLMenuItem = [[NSMenuItem alloc] init];
    [openWithTLMenuItem setTitle:MENU_ITEM_LABEL];
    [openWithTLMenuItem setKeyEquivalent: @"l"];
	[openWithTLMenuItem setKeyEquivalentModifierMask:NSCommandKeyMask];
	[openWithTLMenuItem setTarget:self];
    // [openWithTLMenuItem setAction:@selector(didClickOpenWithTweetLibrary:)];    
    [openWithTLMenuItem setEnabled:NO];    
	[openWithTLMenuItem retain];
    [tweetSubMenu insertItem:openWithTLMenuItem atIndex:14];

    SWIZZLE(@"ABUITableViewCell", setSelected:animated:, CTTL__setSelected:animated:);
    SWIZZLE(@"ABRowView", setSelected:animated:, CTTL__setSelected:animated:);
    NSLog(@"ClickToTweetLibrary loaded");
}

@end
