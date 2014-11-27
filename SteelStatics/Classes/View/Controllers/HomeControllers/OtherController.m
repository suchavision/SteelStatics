#import "OtherController.h"

#import "AppInterface.h"


static NSString*  otherTableViewCellReuseIdentifier = @"otherTableViewCellReuseIdentifier";

@interface OtherController () <UITableViewDataSource, UITableViewDelegate>


@end



@implementation OtherController
{
    NSMutableDictionary* sectionZeroViewKeyFrames;
}


@synthesize otherTableView;


@synthesize sectionZeroView;


@synthesize sectionZeroContents;



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    __weak OtherController* weakInstance = self;
    // otherTableView
    otherTableView = [[UITableView alloc] init];
    otherTableView.delegate = self;
    otherTableView.dataSource = self;
    otherTableView.frame = CanvasRect(0, 100, 768, 920);
    if ([otherTableView respondsToSelector:@selector(setSeparatorInset:)]) [otherTableView setSeparatorInset:UIEdgeInsetsZero]; // useless when cell count != 0
    otherTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [otherTableView registerClass:[OtherTableViewCell class] forCellReuseIdentifier:otherTableViewCellReuseIdentifier];
    [ColorHelper setBorder: otherTableView color:[UIColor blackColor]];
    [[self contentView] addSubview: otherTableView];
    
    // section view
    sectionZeroViewKeyFrames = [NSMutableDictionary dictionary];
    sectionZeroView = [[UIView alloc] init];
    UITextField* textField = nil;
    int count = 5;
    for (int i = 0; i < count; i++) {
        NSString* title = nil;
        NSString* attributeKey = nil;
        CGRect rect = CanvasRect(0, 0, 100, 30);
        rect.origin.x = [textField originX] + [textField sizeWidth] + 1;
        
        if (i == 0) {
            title = @"項目名稱";
            rect.size.width += CanvasW(50);
            attributeKey = kProject_Name;
            
        } else if (i == 1) {
            title = @"材料規格";
            rect.size.width += CanvasW(200);
            attributeKey = kMaterial_Specifications;
            
        } else if (i == 2) {
            title = @"單位";
            attributeKey = kColumn_Unit;
            
        } else if (i == 3) {
            title = @"数量";
            rect.size.width += CanvasW(0);
            attributeKey = kColumn_Caculate_Quantity;
            
            /*
        } else if (i == 4) {
            title = @"單價";
            attributeKey = kColumn_Unit_Price;
            
        } else if (i == 5) {
            title = @"總價";
            attributeKey = kColumn_Total_Price;
            */
        } else if (i == count -1) {
            rect.size.width = otherTableView.frame.size.width - rect.origin.x;
            attributeKey = kColumn_Action;
        }
        
        [sectionZeroViewKeyFrames setObject:NSStringFromCGRect(rect) forKey:attributeKey];
        
        BaseTextField* field = [[BaseTextField alloc] initWithFrame:rect];
        field.layer.borderWidth = 0.5;
        field.textAlignment = NSTextAlignmentCenter;
        field.tag = OTHER_TABLE_COLUMN_TAG(i);
        field.attributeKey = attributeKey;
        field.font = [UIFont fontWithName:@"Arial" size:CanvasFontSize(18)];
        field.enabled = NO;
        field.text = title;
        [sectionZeroView addSubview: field];
        textField = field;
    }
    
    // data source
    NSArray* defaultDatasources = [JsonFileManager getJsonFromFile:@"otherTableViewDataSources.json"];
    sectionZeroContents = [ArrayHelper deepCopy: defaultDatasources];
}


-(UIView*) contentView
{
    return [self.view.subviews firstObject];
}











#pragma mark - TableView Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return sectionZeroContents.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OtherTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:otherTableViewCellReuseIdentifier forIndexPath:indexPath];
    
    if (!cell.isInitialize) {
        [cell initialize: sectionZeroViewKeyFrames];
    }
    
    [cell setContents: [sectionZeroContents safeObjectAtIndex: indexPath.row]];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CanvasH(50);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CanvasH(30);
}


#pragma mark - TableView Delegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return sectionZeroView;
}



// ----------------------- Delete Begin -----------------------
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView endEditing:YES];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [sectionZeroContents removeObjectAtIndex: indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation: UITableViewRowAnimationBottom];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        
    }
    [tableView performSelector:@selector(reloadData) withObject:nil afterDelay:0.5];
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"刪除";
}
// ----------------------- Delete End -----------------------

@end
