//
//  UILabel+AnimateCount.m
//
//  Created by on 2018/4/13.
//  Copyright © 2018年. All rights reserved.
//

#import "UILabel+AnimateCount.h"
#import <objc/runtime.h>
#import <CoreText/CoreText.h>
#import <Foundation/Foundation.h>

#define kPointsNumber 50 // 即数字跳50次

@implementation UILabel (AnimateCount)

#pragma mark - AssociatedObjects
- (NSMutableArray *)numberPoints {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setNumberPoints:(NSMutableArray *)numberPoints {
    objc_setAssociatedObject(self, @selector(numberPoints), numberPoints, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)lastTime {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setLastTime:(CGFloat)lastTime {
    objc_setAssociatedObject(self, @selector(lastTime), [NSString stringWithFormat:@"%.2f",lastTime], OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)fromTime {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setFromTime:(CGFloat)fromTime {
    objc_setAssociatedObject(self, @selector(fromTime), [NSString stringWithFormat:@"%.2f",fromTime], OBJC_ASSOCIATION_ASSIGN);
}

- (int)duration {
    return [objc_getAssociatedObject(self, _cmd) intValue];
}

- (void)setDuration:(int)duration {
    objc_setAssociatedObject(self, @selector(duration), @(duration), OBJC_ASSOCIATION_ASSIGN);
}

- (int)indexNumber {
    return [objc_getAssociatedObject(self, _cmd) intValue];
}

- (void)setIndexNumber:(int)indexNumber {
    objc_setAssociatedObject(self, @selector(indexNumber), @(indexNumber), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)beforeTime {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setBeforeTime:(CGFloat)beforeTime {
    objc_setAssociatedObject(self, @selector(beforeTime), [NSString stringWithFormat:@"%.2lf",beforeTime], OBJC_ASSOCIATION_ASSIGN);
}

#pragma mark - private method
- (void)changeNumberFromCurrentNumberTo:(NSString *)lastNumber duration:(int)duration {
    self.lastTime = lastNumber.floatValue;
    self.duration = duration;
    self.fromTime = self.text.floatValue;
    if (self.text.floatValue != lastNumber.floatValue) {
        [self startChangeValue];
    }
}

- (void)changeNumberFrom:(NSString *)fromNumber to:(NSString *)lastNumber duration:(int)duration {
    self.text = fromNumber;
    self.lastTime = lastNumber.floatValue;
    self.fromTime = fromNumber.floatValue;
    self.duration = duration;
    if (fromNumber.floatValue != lastNumber.floatValue) {
        [self startChangeValue];
    }
}

- (void)startChangeValue {
    self.indexNumber = 0;
    self.beforeTime = 0;
    [self initPoints];
    [self changeNumberBySelector];
}

- (void)initPoints {
    self.numberPoints = [[NSMutableArray alloc] init];
    float dt;
    dt = 1.0 / (kPointsNumber - 1);
    
    for (int i = 0; i < kPointsNumber; i++) {
        float durationTime = dt * i  * self.duration;
        float value = dt * i * (self.lastTime - self.fromTime) + self.fromTime;
        [self.numberPoints addObject:[NSArray arrayWithObjects:[NSNumber numberWithFloat:durationTime], [NSNumber numberWithFloat:value], nil]];
    }
}

- (void)changeNumberBySelector {
    if (self.indexNumber >= kPointsNumber) {
        self.text = [NSString stringWithFormat:@"%.2lf",self.lastTime];
        return;
    } else {
        NSArray *pointValues = [self.numberPoints objectAtIndex:self.indexNumber];
        self.indexNumber++;
        float value = [(NSNumber *)[pointValues objectAtIndex:1] floatValue];
        float currentTime = [(NSNumber *)[pointValues objectAtIndex:0] floatValue];
        float timeDuration = currentTime - self.beforeTime;
        self.beforeTime = currentTime;
        self.text = [NSString stringWithFormat:@"%.2lf",value];
        [self performSelector:@selector(changeNumberBySelector) withObject:nil afterDelay:timeDuration];
    }
}

@end
