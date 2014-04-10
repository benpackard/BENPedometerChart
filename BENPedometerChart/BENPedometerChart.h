//
//  BENPedometerChart.h
//  BENPedometerChartDemo
//
//  Created by Ben Packard on 4/10/14.
//  Copyright (c) 2014 Ben Packard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BENPedometerChartDataSource <NSObject>

@required
- (NSUInteger)numberOfBars;
- (CGFloat)relativeHeightForBarAtIndex:(NSUInteger )barIndex;

@optional
- (UIColor *)colorForBarAtIndex:(NSUInteger)barIndex;
- (NSString *)innerTitleForBarAtIndex:(NSUInteger)barIndex;
- (NSString *)overTitleForBarAtIndex:(NSUInteger)barIndex;
- (NSString *)underTitleForBarAtIndex:(NSUInteger)barIndex;

@end

@interface BENPedometerChart : UIView

@property (weak) id <BENPedometerChartDataSource> dataSource;

- (void)reloadChart;

@end
