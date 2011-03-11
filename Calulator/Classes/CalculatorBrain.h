//
//  CalculatorBrain.h
//  Calulator
//
//  Created by Kunal Deo on 1/27/11.
//  Copyright 2011 KDInc All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CalculatorBrain : NSObject {
	double operand;
	NSString *waitingOperation;
	double waitingOperand;

}

-(void) setOperand:(double)aDouble;
-(double) performOperation:(NSString *)operation;
-(void) clear;


@end
