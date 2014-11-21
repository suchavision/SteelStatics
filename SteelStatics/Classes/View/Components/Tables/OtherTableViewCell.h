#import <UIKit/UIKit.h>

@interface OtherTableViewCell : UITableViewCell


@property (strong, readonly) NSString* identifcation;


@property (assign, readonly) BOOL isInitialize;


-(void) initialize: (NSDictionary*)dictionary;


-(NSMutableDictionary*) getContents;

-(void) setContents:(NSMutableDictionary *)contents;





@end
