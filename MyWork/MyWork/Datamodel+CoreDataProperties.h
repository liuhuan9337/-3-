//
//  Datamodel+CoreDataProperties.h
//  MyWork
//
//  Created by 刘欢 on 16/3/26.
//  Copyright © 2016年 Sea. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Datamodel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Datamodel (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *biaoti;
@property (nullable, nonatomic, retain) NSString *xiaoqu;
@property (nullable, nonatomic, retain) NSString *time;
@property (nullable, nonatomic, retain) NSString *didian;
@property (nullable, nonatomic, retain) NSString *aphoneNumber;
@property (nullable, nonatomic, retain) NSString *qq;
@property (nullable, nonatomic, retain) NSString *leixing;
@property (nullable, nonatomic, retain) NSString *gengduo;
@property (nullable, nonatomic, retain) NSString *diu;

@end

NS_ASSUME_NONNULL_END
