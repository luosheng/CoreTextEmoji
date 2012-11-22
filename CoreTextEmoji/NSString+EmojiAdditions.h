//
//  NSString+EmojiAdditions.h
//  CoreTextEmoji
//
//  Created by Luo Sheng on 12-11-22.
//  Copyright (c) 2012年 CodeLeaks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (EmojiAdditions)

- (NSString *)stringByAddingZeroWidthSpacesAfterEmojiCharacters;

@end
