//
//  BENDemoController.m
//  BENPedometerChartDemo
//
//  Created by Ben Packard on 4/10/14.
//  Copyright (c) 2014 Ben Packard. All rights reserved.
//

#import "BENDemoController.h"

//views
#import "BENPedometerChart.h"

@interface BENDemoController ()

@property NSArray *barHeights, *innerTitles, *underTitles;

@end

@implementation BENDemoController

- (void)viewDidLoad
{
    [super viewDidLoad];

	self.view.backgroundColor = [UIColor whiteColor];
	
	//data for the bar chart
	self.barHeights = @[@3491, @5051, @6277, @4375, @7879, @9689, @10139];
	self.innerTitles = @[@"2.6 km", @"3.8 km", @"4.7 km", @"3.3 km", @"5.9 km", @"7.2 km", @"7.6 km"];
	self.underTitles = @[@"Tue", @"Wed", @"Thu", @"Fri", @"Sat", @"Sun", @"Mon"];
	
	BENPedometerChart *chart = [[BENPedometerChart alloc] init];
	chart.translatesAutoresizingMaskIntoConstraints = NO;
	chart.dataSource = self;
	[self.view addSubview:chart];
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-10-[chart]-10-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(chart)]];
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[chart(==280)]-20-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(chart)]];
	
	[chart reloadChart];
}

#pragma mark - bar chart data source

- (NSUInteger)numberOfBars
{
	return self.barHeights.count;
}

- (CGFloat)relativeHeightForBarAtIndex:(NSUInteger)barIndex
{
	NSNumber *height = [self.barHeights objectAtIndex:barIndex];
	return height.floatValue;
}

- (UIColor *)colorForBarAtIndex:(NSUInteger)barIndex
{
	if (barIndex == 0 || barIndex == 3)
	{
		return [UIColor colorWithRed:0.97 green:0.22 blue:0.24 alpha:1.0];
	}
	else if (barIndex == 6)
	{
		return [UIColor colorWithRed:0.3 green:0.85 blue:0.25 alpha:1.0];
	}
	else
	{
		return [UIColor colorWithRed:0.96 green:0.47 blue:0.15 alpha:1.0];
	}
}

- (NSString *)innerTitleForBarAtIndex:(NSUInteger)barIndex
{
	return [self.innerTitles objectAtIndex:barIndex];
}

- (NSString *)underTitleForBarAtIndex:(NSUInteger)barIndex
{
	return [self.underTitles objectAtIndex:barIndex];
}

- (NSString *)overTitleForBarAtIndex:(NSUInteger)barIndex
{
	return @"10,000";
}

@end
