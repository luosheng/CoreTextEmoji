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
	
	NSString *string = @"😢演示这个问题出在哪里";
	NSDictionary *attributes = @{(id)kCTFontAttributeName : [UIFont systemFontOfSize:FONT_SIZE]};
	NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string attributes:attributes];
	CTLineRef line = CTLineCreateWithAttributedString((__bridge CFAttributedStringRef)(attributedString));
	CGContextSetTextMatrix(context, CGAffineTransformMakeScale(1.0, -1.0));
	CGContextSetTextPosition(context, 10, 50);
	CTLineDraw(line, context);
	
	NSString *string2 = [string stringByAddingZeroWidthSpacesAfterEmojiCharacters];
	NSAttributedString *attributedString2 = [[NSAttributedString alloc] initWithString:string2 attributes:attributes];
	CTLineRef line2 = CTLineCreateWithAttributedString((__bridge CFAttributedStringRef)(attributedString2));
	CGContextSetTextPosition(context, 10, 100);
	CTLineDraw(line2, context);
	
	NSDictionary *attributes3 = @{(id)kCTFontAttributeName : [UIFont fontWithName:@"AppleColorEmoji" size:FONT_SIZE]};
	NSAttributedString *attributedString3 = [[NSAttributedString alloc] initWithString:string attributes:attributes3];
	CTLineRef line3 = CTLineCreateWithAttributedString((__bridge CFAttributedStringRef)(attributedString3));
	CGContextSetTextPosition(context, 10, 150);
	CTLineDraw(line3, context);
}

@end
