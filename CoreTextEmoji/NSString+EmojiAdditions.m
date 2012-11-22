//
//  NSString+EmojiAdditions.m
//  CoreTextEmoji
//
//  Created by Luo Sheng on 12-11-22.
//  Copyright (c) 2012年 CodeLeaks. All rights reserved.
//

#import "NSString+EmojiAdditions.h"
#import "NSCharacterSet+EmojiAdditions.h"

#define ZERO_WIDTH_SPACE @"\u200B"

@implementation NSString (EmojiAdditions)

- (NSString *)stringByAddingZeroWidthSpacesAfterEmojiCharacters {
	__block NSMutableString *string = [NSMutableString string];
	[self enumerateSubstringsInRange:NSMakeRange(0, self.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
		[string appendString:substring];
		if (substringRange.length == 2) {
			unichar hs = [substring characterAtIndex:0];
			unichar ls = [substring characterAtIndex:1];
			UTF32Char uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
			if ([[NSCharacterSet emojiCharacterSet] longCharacterIsMember:uc]) {
				[string appendString:ZERO_WIDTH_SPACE];
			}
		}
	}];
	return [string copy];
}

@end
