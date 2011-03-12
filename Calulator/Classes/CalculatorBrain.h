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

@property double operand;
@property (readonly) id expression;

- (void) setVariableAsOperand:(NSString *)variableName;
- (double) performOperation:(NSString *)operation;

+ (double) evaluateExpression:(id)anExpression
         usingVariableValues:(NSDictionary *)variables;

+ (NSSet *) variablesInExpression:(id)anExpression;
+ (NSString *) descriptionOfExpression:(id)anExpression;

+ (id) propertyListForExpression:(id)anExpression;
+ (id) expressionForPropertyList: (id)propertyList;


@end
