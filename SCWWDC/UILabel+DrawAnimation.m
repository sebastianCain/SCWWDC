//
//  UILabel+DrawAnimation.m
//  Snappr
//
//  Created by Sebastian Cain on 6/2/15.
//  Copyright (c) 2015 Sebastian Cain. All rights reserved.
//

#import "UILabel+DrawAnimation.h"
#import <CoreText/CoreText.h>

@implementation UILabel (DrawAnimation)


- (CAShapeLayer *)convertToLayer {
	
	self.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
	
	CGPoint saveOrigCenter = self.center;
	
	[self sizeToFit];
	
	[self setCenter:saveOrigCenter];
	
	[self.layer setOpacity:0];
	
	//[self setBackgroundColor:[UIColor blueColor]];
	
	CGMutablePathRef letters = CGPathCreateMutable();
	
	NSString *name = self.font.fontName;
	
	CFStringRef nameRef = (__bridge CFStringRef)name;
	
	CTFontRef font = CTFontCreateWithName(nameRef, self.font.pointSize, NULL);
	NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys: (__bridge id)font, kCTFontAttributeName, nil];
	NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:self.text
																	 attributes:attrs];
	CTLineRef line = CTLineCreateWithAttributedString((CFAttributedStringRef)attrString);
	CFArrayRef runArray = CTLineGetGlyphRuns(line);
	
	// for each RUN
	for (CFIndex runIndex = 0; runIndex < CFArrayGetCount(runArray); runIndex++)
	{
		// Get FONT for this run
		CTRunRef run = (CTRunRef)CFArrayGetValueAtIndex(runArray, runIndex);
		CTFontRef runFont = CFDictionaryGetValue(CTRunGetAttributes(run), kCTFontAttributeName);
		
		// for each GLYPH in run
		for (CFIndex runGlyphIndex = 0; runGlyphIndex < CTRunGetGlyphCount(run); runGlyphIndex++)
		{
			// get Glyph & Glyph-data
			CFRange thisGlyphRange = CFRangeMake(runGlyphIndex, 1);
			CGGlyph glyph;
			CGPoint position;
			CTRunGetGlyphs(run, thisGlyphRange, &glyph);
			CTRunGetPositions(run, thisGlyphRange, &position);
			
			// Get PATH of outline
			{
				CGPathRef letter = CTFontCreatePathForGlyph(runFont, glyph, NULL);
				CGAffineTransform t = CGAffineTransformMakeTranslation(position.x, position.y);
                
				CGPathAddPath(letters, &t, letter);
				CGPathRelease(letter);
			}
		}
	}
	CFRelease(line);
	
	UIBezierPath *path = [UIBezierPath bezierPath];
	[path appendPath:[UIBezierPath bezierPathWithCGPath:letters]];
	
	CGPathRelease(letters);
	CFRelease(font);
	
	CAShapeLayer *pathLayer = [CAShapeLayer layer];
	pathLayer.frame = self.layer.frame;
	pathLayer.bounds = self.layer.bounds;
	pathLayer.geometryFlipped = YES;
	pathLayer.path = path.CGPath;
	pathLayer.strokeColor = self.textColor.CGColor;
	pathLayer.fillColor = nil;
	pathLayer.lineWidth = 1;
	pathLayer.lineJoin = kCALineJoinRound;
    pathLayer.strokeEnd = 0;
	[self.layer.superlayer addSublayer:pathLayer];
	
	
	[pathLayer setPosition:CGPointMake(pathLayer.position.x, pathLayer.position.y+self.font.descender)];
    
    return pathLayer;
//	
//	CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//	pathAnimation.duration = 1;
//	pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
//	pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
//	[pathAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
//	
//	CABasicAnimation *fadeOutAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
//	fadeOutAnimation.duration = 1;
//	fadeOutAnimation.fromValue = @1;
//	fadeOutAnimation.toValue = @0;
//	
//	
//	
//	[CATransaction begin]; {
//		[CATransaction setCompletionBlock:^{
//			if (fade) {
//				//Fade actual Label in and path out
//				[CATransaction begin]; {
//					[CATransaction setCompletionBlock:^{
//						[pathLayer removeFromSuperlayer];
//					}];
//					[pathLayer addAnimation:fadeOutAnimation forKey:@"opacity"];
//					[UIView animateKeyframesWithDuration:1 delay:0 options:0 animations:^{
//						[self.layer setOpacity:1];
//					} completion:nil];
//				} [CATransaction commit];
//			}
//		}];
//	
//		//Animate Path
//		[pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
//	
//	} [CATransaction commit];
//	
}

@end
