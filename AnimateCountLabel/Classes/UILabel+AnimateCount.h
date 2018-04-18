//
//  UILabel+AnimateCount.h
//
//  Created by maitianer on 2018/4/13.
//  Copyright © 2018年 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (AnimateCount)

- (void)changeNumberFromCurrentNumberTo:(NSString *)lastNumber
                               duration:(int)duration;

- (void)changeNumberFrom:(NSString *)fromNumber
                      to:(NSString *)lastNumber
                duration:(int)duration;

@end
