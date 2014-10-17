#import "ValueView.h"
#import "AppInterface.h"


@implementation ValueView


-(NSMutableDictionary*)getDatas
{
    
    NSMutableDictionary* datas = [NSMutableDictionary dictionary];
    
    [ViewHelper iterateSubView: self class:[BaseTextField class] handler:^BOOL(UIView *view) {
        BaseTextField* textField = (BaseTextField*) view;
        
        NSString* value = textField.text;
        if (! value) value = @"";
        
        NSString* key = textField.attributeKey;
        if (textField.attributeKey) {
            [datas setObject:value forKey:key];
        }
        
        // hard code now
        [datas setObject: @"Kg" forKey:kResult_Unit];
        
        return NO;
    }];
    
    ValueCaculateView* caView = (ValueCaculateView*)[ViewHelper getSubview:self clazz:[ValueCaculateView class]];
    UIImage* croppedImage = [ViewHelper imageFromView: caView];
    [datas setObject:croppedImage forKey: kFormula_Image];
    
    NSLog(@"--- %@" , datas);
    
    
    NSMutableDictionary* caluateDictionary = [NSMutableDictionary dictionary];
    
    ValueCaculateView* ValueCaculateView = [self getValueCaculateView];
    
    [ViewHelper iterateSubView:ValueCaculateView class:[CaculateTextField class] handler:^BOOL(UIView *view) {
        if ([view isKindOfClass:[CaculateTextField class]]) {
            CaculateTextField* tx = (CaculateTextField*)view;
            
            if (tx.hidden) {
                return NO;
            }
            NSString* txAttributeKey = tx.attributeKey;
            if (! txAttributeKey) txAttributeKey = @"TEMP";
            
            NSMutableArray* labelTexts = [NSMutableArray array];
            
            NSArray* labels = [ValueView getCenterXInScopeLabels: tx];
            
            if (labels.count == 1) {
                UILabel* label = [labels firstObject];
                NSString* labelText = label.text;
                
                [labelTexts addObject: labelText];
                
            } else if (labels.count == 2) {
                
                UILabel* label1 = [labels firstObject];
                UILabel* label2 = [labels lastObject];
                NSString* labelText1 = label1.text;
                NSString* labelText2 = label2.text;
                
                if (label1.originY < label2.originY) {
                    [labelTexts addObject: labelText1];
                    [labelTexts addObject: labelText2];
                } else {
                    [labelTexts addObject: labelText2];
                    [labelTexts addObject: labelText1];
                }
                
            }
        
            NSDictionary* datas = @{@"TextFiled": tx.text, @"Labels":labelTexts};
            
            [caluateDictionary setObject: datas forKey:txAttributeKey];
            
        }
        return NO;
    }];
    
    
    [datas setObject: caluateDictionary forKey:@"FORMULA"];
    
    return datas ;
}


-(ValueCaculateView*) getValueCaculateView
{
    __block ValueCaculateView* result = nil;
    [ViewHelper iterateSubView: self class:[ValueCaculateView class] handler:^BOOL(UIView *view) {
        if ([view isKindOfClass:[ValueCaculateView class]]) {
            ValueCaculateView* temp = (ValueCaculateView*)view;
            result = temp;
            return YES;
        }
        return NO;
    }];
    return result;
}


+(NSArray*) getCenterXInScopeLabels: (UIView*)view
{
    NSMutableArray* labels = [NSMutableArray array];
    
    CGFloat txCenterX = view.centerX;
    for (UIView* subView in view.superview.subviews) {
        if ([subView isKindOfClass:[UILabel class]]) {
            UILabel* label = (UILabel*)subView;
            
            if (label.hidden) {
                return nil;
            }
            
            CGFloat labelCenterX = label.centerX;
            CGFloat scope = CanvasW(5);
            if (labelCenterX - scope <= txCenterX && txCenterX <= labelCenterX + scope) {
                [labels addObject: label];
            }
        }
    }
    
    return labels;
}

@end
