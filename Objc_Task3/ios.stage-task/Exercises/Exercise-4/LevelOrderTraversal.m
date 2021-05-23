#import "LevelOrderTraversal.h"

@interface TreeNode : NSObject
 
@property NSNumber *value;
@property TreeNode *left;
@property TreeNode *right;
 
- (TreeNode *)initWithValue:(NSNumber *)value;
- (TreeNode *)getTreeFromPreorder:(NSArray *) preorder;
- (NSMutableArray *)getLevelTraversal;
 
@end

@implementation TreeNode
 
- (TreeNode *)initWithValue:(NSNumber *)value {
 
    self = [super init];
    if (self != nil) {
        self.value = value;
        self.left = NULL;
        self.right = NULL;
    }
    
    return self;
}

- (TreeNode *)getTreeFromPreorder:(NSArray *)array {
    if (array.count <= gIndex || array[gIndex] == [NSNull null])return nil;
    
    TreeNode *treeRoot = [[TreeNode alloc] initWithValue: array[gIndex]];
    
    if ((array.count - 1) == gIndex)return treeRoot;
    
    gIndex++;
    treeRoot.left = [[TreeNode alloc] getTreeFromPreorder: array];
    
    gIndex++;
    treeRoot.right = [[TreeNode alloc] getTreeFromPreorder: array];
    
    return treeRoot;
}

- (NSMutableArray *)getLevelTraversal {
    
    NSMutableArray *result = [[NSMutableArray alloc] initWithObjects:[[NSMutableArray alloc] initWithObjects: self.value, nil], nil];
    
    if (self.left != nil) {
        NSArray *left = self.left.getLevelTraversal;
        for (int i = 0; i < left.count; i++) {
            if (i < result.count - 1) [result[i + 1] addObjectsFromArray:left[i]];
            else [result addObject: left[i]];
        }
    }
    
    if (self.right != nil) {
        NSArray *right = self.right.getLevelTraversal;
        for (int i = 0; i < right.count; i++) {
            if (i < result.count - 1) [result[i + 1] addObjectsFromArray:right[i]];
            else [result addObject: right[i]];
        }
    }
    
    return result;
}
 
@end

int gIndex;

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    
    gIndex = 0;
    TreeNode *restoredTree = [[TreeNode alloc] getTreeFromPreorder:tree];
    
    if (restoredTree)return [restoredTree getLevelTraversal];
    else return @[];
    
}
