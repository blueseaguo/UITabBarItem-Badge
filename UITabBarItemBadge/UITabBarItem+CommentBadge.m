//
//  UITabBarItem+CommentBadge.m
//  UITabBarItemBadge
//
//  Created by guo on 15/9/16.
//  Copyright (c) 2015年 guo. All rights reserved.
//
#import <objc/runtime.h>
#import "UITabBarItem+CommentBadge.h"
#import <M13BadgeView/M13BadgeView.h>
#import "M13BadgeView+Common.h"

static void *customBadgeKey = &customBadgeKey;
static void *redPointViewKey = &redPointViewKey;
@implementation UITabBarItem (CommentBadge)


- (M13BadgeView *)customBadgeView
{
    M13BadgeView *badgeView = objc_getAssociatedObject(self, customBadgeKey);
    if (!badgeView) {
        badgeView = [M13BadgeView tabbarItemBadgeView];
        badgeView.alignmentShift = CGSizeMake(-2.0f, 6.0f);
        objc_setAssociatedObject(self, customBadgeKey, badgeView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        UIView *presentView = [self valueForKey:@"view"];
        for (UIView *view in presentView.subviews) {
            NSString *viewstring = NSStringFromClass([view class]);
            if([viewstring isEqualToString:@"UITabBarSwappableImageView"])
            {
                [view addSubview: badgeView];
            }
        }
    }
    return badgeView;
}

-(void)setCustomBadgeValue:(NSString *)value
{
    if (value.length == 0) {
        [self customBadgeView].hidden = YES;
    }
    else
    {
        M13BadgeView *badgeView = [self customBadgeView];
        badgeView.hidden = NO;
        badgeView.text = value;
    }
}

- (UIImageView *)redPointView
{
    UIImageView *redPointView = objc_getAssociatedObject(self, redPointViewKey);
    if (redPointView == nil) {
        redPointView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 5.0f, 5.0f)];
        [redPointView setImage:[UIImage imageNamed:@"red_point"]];
        objc_setAssociatedObject(self, redPointViewKey, redPointView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        UIView *presentView = [self valueForKey:@"view"];
        for (UIView *view in presentView.subviews) {
            NSString *viewstring = NSStringFromClass([view class]);
            if([viewstring isEqualToString:@"UITabBarSwappableImageView"])
            {
                [view addSubview: redPointView];
            }
        }
    }
    return redPointView;
}

- (void)setupUnreadRedPoint:(NSString *)value
{
    if (value.length == 0) {
        [self redPointView].hidden = YES;
    }
    else
    {
        [self redPointView].hidden = NO;
    }
}



@end
