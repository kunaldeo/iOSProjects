//
//  CalculatorBrain.m
//  Calulator
//
//  Created by Kunal Deo on 1/27/11.
//  Copyright 2011 KDInc All rights reserved.
//

#import "CalculatorBrain.h"


@implementation CalculatorBrain

double memval = 0;
@synthesize operand;

-(void) clear
{
    memval = 0;
}




-(void)performWaitingOperation
{
	if ([@"+" isEqual:waitingOperation])
	{
		operand = waitingOperand + operand;
	}
	
	else if ([@"-" isEqual:waitingOperation])
	{
		operand = waitingOperand - operand;
	}
	
	else if ([@"X" isEqual:waitingOperation])
	{
		operand = waitingOperand * operand;
	}
	
	else if ([@"/" isEqual:waitingOperation])
	{
        
		if (operand) {
            
            if (waitingOperand == 0) {
                UIAlertView *alert;
                alert = [[UIAlertView alloc] initWithTitle:@"Invalid Operation" message:@"You are trying to divide 0" delegate:self cancelButtonTitle:@"Retry" otherButtonTitles: nil];
                [alert show];
                [alert release];
                
            }
            else {
                operand = waitingOperand / operand;
            }			
		}
	}
}


-(double) performOperation:(NSString *)operation
{
	if([operation isEqual:@"SQRT"])
	{
		operand = sqrt(operand);
	}
	
	if([operation isEqual:@"1/X"])
	{
		if (operand == 0) {
			UIAlertView *alert;
			alert = [[UIAlertView alloc] initWithTitle:@"Invalid Operation" message:@"You are trying to invert 0" delegate:self cancelButtonTitle:@"Retry" otherButtonTitles: nil];
			[alert show];
			[alert release];
			
		}
		else {
			operand = 1/operand;
		}

	}
	
	if([operation isEqual:@"SIN"])
	{
		operand = sin(operand);
	}
    
    if([operation isEqual:@"C"])
	{
		operand = 0;
	}
	
	if([operation isEqual:@"COS"])
	{
		operand = cos(operand);
	}
    
    if([operation isEqual:@"π"])
	{
		operand = operand*3.14159;
	}
	
	else if ([@"+/-" isEqual:operation])
	{
        if (operand == 0) {
			UIAlertView *alert;
			alert = [[UIAlertView alloc] initWithTitle:@"Invalid Operand" message:@"You are trying to negate 0" delegate:self cancelButtonTitle:@"Retry" otherButtonTitles: nil];
			[alert show];
			[alert release];
			
		}
        
        else {
            operand = - operand;
        }
        
	}
	
	else {
		[self performWaitingOperation];
		waitingOperation = operation;
		waitingOperand = operand;
       
	}

	
	return operand;
	
}


@end
