#import <UIKit/UIKit.h>

@interface OtherTableViewCell : UITableViewCell


@property (assign, readonly) BOOL isInitialize;


-(void) initialize: (NSDictionary*)dictionary;

-(void) setContents: (NSDictionary*)contents;

-(NSMutableDictionary*) getContents;


@end
