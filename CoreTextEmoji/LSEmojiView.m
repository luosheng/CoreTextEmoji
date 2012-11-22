//
//  LSEmojiView.m
//  CoreTextEmoji
//
//  Created by Luo Sheng on 12-11-22.
//  Copyright (c) 2012年 CodeLeaks. All rights reserved.
//

#import "LSEmojiView.h"
#import <CoreText/CoreText.h>
#import "NSString+EmojiAdditions.h"

#define FONT_SIZE 24

@implementation LSEmojiView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	NSString *string = @"😢中文测试 English test";
	NSDictionary *attributes = @{(id)kCTFontAttributeName : [UIFont systemFontOfSize:FONT_SIZE]};
	NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string attributes:attributes];
	CTLineRef line = CTLineCreateWithAttributedString((__bridge CFAttributedStringRef)(attributedString));
	CGContextSetTextMatrix(context, CGAffineTransformMakeScale(1.0, -1.0));
	CGContextSetTextPosition(context, 10, 50);
	CTLineDraw(line, context);
	CFRelease(line);
	
	NSString *string2 = [string stringByAddingZeroWidthSpacesAfterEmojiCharacters];
	NSAttributedString *attributedString2 = [[NSAttributedString alloc] initWithString:string2 attributes:attributes];
	CTLineRef line2 = CTLineCreateWithAttributedString((__bridge CFAttributedStringRef)(attributedString2));
	CGContextSetTextPosition(context, 10, 100);
	CTLineDraw(line2, context);
	CFRelease(line2);
	
	NSDictionary *attributes3 = @{(id)kCTFontAttributeName : [UIFont fontWithName:@"AppleColorEmoji" size:FONT_SIZE]};
	NSAttributedString *attributedString3 = [[NSAttributedString alloc] initWithString:string attributes:attributes3];
	CTLineRef line3 = CTLineCreateWithAttributedString((__bridge CFAttributedStringRef)(attributedString3));
	CGContextSetTextPosition(context, 10, 150);
	CTLineDraw(line3, context);
	CFRelease(line3);
	
	NSDictionary *fontAttributes = @{
		(id)kCTFontFamilyNameAttribute : @"Helvetica",
		(id)kCTFontCascadeListAttribute : @[
			(__bridge_transfer id)CTFontDescriptorCreateWithNameAndSize(CFSTR("AppleColorEmoji"), 0),
	
	// The following line is optional. Core Text should look up in the predefined
	// font cascading list for CJK characters.
	
//			(__bridge_transfer id)CTFontDescriptorCreateWithNameAndSize(CFSTR("STHeitiSC-Light"), 0),
		]
	};
	CTFontDescriptorRef descriptor = CTFontDescriptorCreateWithAttributes((__bridge CFDictionaryRef)(fontAttributes));
	CTFontRef font = CTFontCreateWithFontDescriptor(descriptor, FONT_SIZE, 0);
	NSDictionary *attributes4 = @{(id)kCTFontAttributeName : (__bridge id)font};
	CFRelease(font);
	NSAttributedString *attributedString4 = [[NSAttributedString alloc] initWithString:string attributes:attributes4];
	CTLineRef line4 = CTLineCreateWithAttributedString((__bridge CFAttributedStringRef)(attributedString4));
	CGContextSetTextPosition(context, 10, 200);
	CTLineDraw(line4, context);
	CFRelease(line4);
}

@end
