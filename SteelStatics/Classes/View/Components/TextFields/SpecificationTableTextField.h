#import "SpecificationTextField.h"

@class PopTableView;

@interface SpecificationTableTextField : SpecificationTextField

@property (strong) NSString* categoryKey;

@property (strong) PopTableView* popTableView;

@property (copy) void(^didSelectTextInTableAction)(SpecificationTableTextField* textField);



#pragma mark - Public Methods

-(void) setDataSources: (NSArray*)datasSources;



@end
