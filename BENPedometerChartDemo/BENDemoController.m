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
@property CGFloat target;

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
	self.target = 10000;
	
	BENPedometerChart *chart = [[BENPedometerChart alloc] init];
	chart.translatesAutoresizingMaskIntoConstraints = NO;
	chart.dataSource = self;
	[self.view addSubview:chart];
		
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-10-[chart]-10-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(chart)]];
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[chart]-20-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(chart)]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:chart
														  attribute:NSLayoutAttributeHeight
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.view
														  attribute:NSLayoutAttributeHeight
														 multiplier:0.48
														   constant:0]];
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
	//green = 100% of target, orange = 50%, otherwise red
	if ([self relativeHeightForBarAtIndex:barIndex] > self.target)
	{
		return [UIColor colorWithRed:0.3 green:0.85 blue:0.25 alpha:1.0];
	}
	else if ([self relativeHeightForBarAtIndex:barIndex] > self.target / 2)
	{
		return [UIColor colorWithRed:0.96 green:0.47 blue:0.15 alpha:1.0];
	}
	else
	{
		return [UIColor colorWithRed:0.97 green:0.22 blue:0.24 alpha:1.0];
	}

	return nil;
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
	NSNumberFormatter *formatter = [NSNumberFormatter new];
	[formatter setNumberStyle:NSNumberFormatterDecimalStyle];
	return [formatter stringFromNumber:[self.barHeights objectAtIndex:barIndex]];
}

- (CGFloat)relativeHeightForTargetLine
{
	return self.target;
}

- (UIColor *)colorForTargetLine
{
	return [UIColor colorWithRed:0.3 green:0.85 blue:0.25 alpha:1.0];
}

@end
