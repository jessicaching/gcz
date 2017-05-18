//
//  GCZCommon.h
//  gcz
//
//  Created by Jessica on 15/4/17.
//  Copyright (c) 2015年 Jessica. All rights reserved.
//

#ifndef gcz_GCZCommon_h
#define gcz_GCZCommon_h

#define UIColorWithRGBA(r,g,b,a)        [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define kColorMainBG UIColorWithRGBA(252.0, 252.0, 240.0, 1.0)
#define kColorMainRed UIColorWithRGBA(198.0, 10.0, 20.0, 1.0)
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kFrameWRatio (kScreenWidth / 320.0)
#define kFrameHRatio (kScreenHeight / 480.0)

#define kDataNewsButtonCount @"gcznewsbuttoncount"
#endif
