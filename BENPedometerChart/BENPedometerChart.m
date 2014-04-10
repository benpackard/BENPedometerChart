//
//  BENPedometerChart.m
//  BENPedometerChartDemo
//
//  Created by Ben Packard on 4/10/14.
//  Copyright (c) 2014 Ben Packard. All rights reserved.
//

#import "BENPedometerChart.h"

//views
#import "BENPedometerBarView.h"

@implementation BENPedometerChart

#pragma mark - drawing the chart

- (void)reloadChart
{
	if (!self.dataSource) return;
		
	//remove all existing views and constraints
	for (UIView *view in self.subviews)
	{
		[view removeFromSuperview];
	}
	[self removeConstraints:self.constraints];
	
	//which will be the tallest bar?
	NSUInteger tallestBarIndex = 0;
	CGFloat maxBarHeight = 0;
	for (NSUInteger i = 0; i < [self.dataSource numberOfBars]; i++)
	{
		if ([self.dataSource relativeHeightForBarAtIndex:i] > maxBarHeight)
		{
			tallestBarIndex = i;
			maxBarHeight = [self.dataSource relativeHeightForBarAtIndex:i];
		}
	}

	//create and add the tallest bar view first so that other bar views can be sized proportionally
	BENPedometerBarView *tallestBarView = [[BENPedometerBarView alloc] init];
	[self addSubview:tallestBarView];
	
	//add the rest of the bars
	for (NSInteger i = 0; i < [self.dataSource numberOfBars]; i++)
	{
		BENPedometerBarView *barView = (i == tallestBarIndex) ? tallestBarView : [[BENPedometerBarView alloc] init];
		barView.translatesAutoresizingMaskIntoConstraints = NO;
		if (i != tallestBarIndex) [self addSubview:barView]; //tallest one was already added
		
		//set colors
		if ([self.dataSource respondsToSelector:@selector(colorForBarAtIndex:)])
		{
			UIColor *barColor = [self.dataSource colorForBarAtIndex:i];
			if (barColor)
			{
				barView.bar.backgroundColor = barColor;
				barView.overLabel.textColor = barColor;
			}
		}
		
		//set labels
		if ([self.dataSource respondsToSelector:@selector(innerTitleForBarAtIndex:)]) barView.innerLabel.text = [self.dataSource innerTitleForBarAtIndex:i];
		if ([self.dataSource respondsToSelector:@selector(overTitleForBarAtIndex:)]) barView.overLabel.text = [self.dataSource overTitleForBarAtIndex:i];
		if ([self.dataSource respondsToSelector:@selector(underTitleForBarAtIndex:)]) barView.underLabel.text = [self.dataSource underTitleForBarAtIndex:i];
		
		//the width of each bar depends on the number of bars
		[self addConstraint:[NSLayoutConstraint constraintWithItem:barView
														 attribute:NSLayoutAttributeWidth
														 relatedBy:NSLayoutRelationEqual
															toItem:self
														 attribute:NSLayoutAttributeWidth
														multiplier:1.0f / [self.dataSource numberOfBars]
														  constant:-3]]; //a small gap between bars, size could be added to the datasource protocol
		
		//the horizontal offset for each bar depends on the number of bars
		[self addConstraint:[NSLayoutConstraint constraintWithItem:barView
														 attribute:NSLayoutAttributeCenterX
														 relatedBy:NSLayoutRelationEqual
															toItem:self
														 attribute:NSLayoutAttributeCenterX
														multiplier:((2.0 * i) + 1.0) / [self.dataSource numberOfBars]
														  constant:0]];

		
		if (i == tallestBarIndex)
		{
			//the tallest bar view takes the entire height
			[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[barView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(barView)]];
		}
		else
		{
			//others are sized proportionally to the tallest. Note that the inner bars should be proportional, *not* the entire bar views.
			[self addConstraint:[NSLayoutConstraint constraintWithItem:barView.bar
															 attribute:NSLayoutAttributeHeight
															 relatedBy:NSLayoutRelationEqual
																toItem:tallestBarView.bar
															 attribute:NSLayoutAttributeHeight
															multiplier:[self.dataSource relativeHeightForBarAtIndex:i] / maxBarHeight
															  constant:0]];
			
			//align the baselines
			[self addConstraint:[NSLayoutConstraint constraintWithItem:barView
															 attribute:NSLayoutAttributeBottom
															 relatedBy:NSLayoutRelationEqual
																toItem:tallestBarView
															 attribute:NSLayoutAttributeBottom
															multiplier:1
															  constant:0]];
		}
	}
}

@end
