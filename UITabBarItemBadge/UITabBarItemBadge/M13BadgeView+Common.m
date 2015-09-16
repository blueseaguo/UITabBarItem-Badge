//
//  M13BadgeView+Common.m
//  UITabBarItemBadge
//
//  Created by guo on 15/9/16.
//  Copyright (c) 2015年 guo. All rights reserved.
//

#import "M13BadgeView+Common.h"

@implementation M13BadgeView (Common)

+ (M13BadgeView *)tabbarItemBadgeView
{
    M13BadgeView *badgeView = [[M13BadgeView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 14.0f, 14.0f)];
    badgeView.verticalAlignment = M13BadgeViewVerticalAlignmentTop;
    badgeView.horizontalAlignment = M13BadgeViewHorizontalAlignmentRight;
    badgeView.font = [UIFont systemFontOfSize:11.0f];
    badgeView.textColor = [UIColor redColor];
    badgeView.hidesWhenZero = YES;
    badgeView.borderWidth = 1.f;
    badgeView.borderColor = [UIColor whiteColor];
    badgeView.badgeBackgroundColor = [UIColor whiteColor];
    badgeView.cornerRadius = 7.0f;
    return badgeView;
}

@end
