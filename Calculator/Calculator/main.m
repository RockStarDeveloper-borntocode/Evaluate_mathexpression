//
//  main.m
//  Calculator
//
//  Created by Durai Amuthan on 9/24/15.
//  Copyright (c) 2015 Durai Amuthan. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        if(argc<2)
        {
            NSLog(@"Enter the mathematical expression");
        }
        else
        {
        
        NSArray *arrOps=@[@"+",@"-"];
            NSString *MathExpression=[[NSString alloc] initWithUTF8String:argv[1]];
        int sum=0;
        NSMutableString *left=[[NSMutableString alloc]init];
        NSMutableString *right=[[NSMutableString alloc]init];
        NSString *operator=[[NSString alloc]init];
        BOOL isOperatorFound=false;
        BOOL isOperatorChar=false;
        BOOL isFirstCharNegative=false;
        NSMutableArray *arrChars=[[NSMutableArray alloc]init];
        for (int i = 0; i < [MathExpression length]; i++) {
            [arrChars addObject:[NSString stringWithFormat:@"%C", [MathExpression characterAtIndex:i]]];
        }
        
        for (int k=0;k<arrChars.count; k++) {
           // NSLog(@"str:%@",arrChars[k]);
            
            if([arrChars[k] isEqualToString:@"-"] && k==0)
            {
                isFirstCharNegative=true;
            }
            
            for(NSString *op in arrOps){
                if([op isEqualToString:arrChars[k]]){
                    
                    isOperatorChar=true;
                    if(isOperatorFound){
                        
                        if (isFirstCharNegative) {
                            sum=-right.intValue;
                            isFirstCharNegative=false;
                        }
                        else if([operator isEqualToString:@"+"]){
                            sum+=left.intValue+right.intValue;
                            isOperatorFound=false;
                        }
                        else{
                            sum+=left.intValue-right.intValue;
                            isOperatorFound=false;
                        }
                        left=[[NSMutableString alloc]init];
                        right=[[NSMutableString alloc]init];
                    }
                    else{
                        isOperatorFound=true;
                    }
                    operator=op;
                }
            }
            
            if(!isOperatorFound && !isOperatorChar)
                left=[[left stringByAppendingString:arrChars[k]]mutableCopy];
            else if(!isOperatorChar)
                right=[[right stringByAppendingString:arrChars[k]]mutableCopy];
            
            
            isOperatorChar=false;
        }
        
        if([operator isEqualToString:@"+"])
            sum+=left.intValue+right.intValue;
        else if(right.intValue==0)
            sum=sum-left.intValue;
        else
            sum=sum+left.intValue-right.intValue;
        
        NSLog(@"value:%i",sum);
        }
    }
    return 0;
}
