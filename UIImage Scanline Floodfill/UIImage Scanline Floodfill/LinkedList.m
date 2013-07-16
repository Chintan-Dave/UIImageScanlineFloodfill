//
//  LinkedList.m
//  NSDataLinkedList
//
//  Created by Sam Davies on 26/09/2012.
//  Copyright (c) 2012 VisualPutty. All rights reserved.
//

#import "LinkedList.h"

@implementation LinkedList

#pragma mark - Initialisation
- (id)init
{
    return [self initWithCapacity:500];
}

- (id)initWithCapacity:(int)capacity
{
    return [self initWithCapacity:capacity incrementSize:500 andMultiplier:1000];
}

- (id)initWithCapacity:(int)capacity incrementSize:(int)increment andMultiplier:(int)mul
{
    self = [super init];
    
    if(self)
    {
        _cacheSizeIncrements = increment;
        
        int bytesRequired = capacity * sizeof(PointNode);
        
        nodeCache = [[NSMutableData alloc] initWithLength:bytesRequired];
        
        [self initialiseNodesAtOffset:0 count:capacity];
        
        freeNodeOffset = 0;
        topNodeOffset = FINAL_NODE_OFFSET;
        
        multiplier = mul;
    }
    
    return self;
}

#pragma mark - DynamicSizedArray Protocol methods
- (void)pushFrontX:(int)x andY:(int)y;
{
    int p = multiplier * x +y;
    
    PointNode *node = [self getNextFreeNode];
    
    node->point = p;
    node->nextNodeOffset = topNodeOffset;
    
    topNodeOffset = [self offsetOfNode:node];
}


- (int)popFront:(int *)x andY:(int *)y;
{
    if(topNodeOffset == FINAL_NODE_OFFSET)
    {
        return INVALID_NODE_CONTENT;
    }
    
    PointNode *node = [self nodeAtOffset:topNodeOffset];
    
    int thisNodeOffset = topNodeOffset;
    
    // Remove this node from the queue
    topNodeOffset = node->nextNodeOffset;
    int value = node->point;
    
    // Reset it and add it to the free node cache
    node->point = 0;
    node->nextNodeOffset = freeNodeOffset;
    
    freeNodeOffset = thisNodeOffset;
    
    *x = value / multiplier;
    *y = value % multiplier;
    
    return value;
}



#pragma mark - utility functions

- (int)offsetOfNode:(PointNode *)node
{
    return node - (PointNode *)nodeCache.mutableBytes;
}

- (PointNode *)nodeAtOffset:(int)offset
{
    return (PointNode *)nodeCache.mutableBytes + offset;
}

- (PointNode *)getNextFreeNode
{
    if(freeNodeOffset < 0) {
        // Need to extend the size of the nodeCache
        int currentSize = nodeCache.length / sizeof(PointNode);
        [nodeCache increaseLengthBy:_cacheSizeIncrements * sizeof(PointNode)];
        // Set these new nodes to be the free ones
        [self initialiseNodesAtOffset:currentSize count:_cacheSizeIncrements];
        freeNodeOffset = currentSize;
    }
    
    PointNode *node = (PointNode*)nodeCache.mutableBytes + freeNodeOffset;
    freeNodeOffset = node->nextNodeOffset;
    return node;
}


- (void)initialiseNodesAtOffset:(int)offset count:(int)count
{
    PointNode *node = (PointNode *)nodeCache.mutableBytes + offset;
    for (int i=0; i<count - 1; i++) {
        node->point = 0;
        node->nextNodeOffset = offset + i + 1;
        node++;
    }
    node->point = 0;
    // Set the next node offset to make sure we don't continue
    node->nextNodeOffset = FINAL_NODE_OFFSET;
}

@end
