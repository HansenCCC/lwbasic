//
//  NSString+LWExtension.h
//  lwbasic
//
//  Created by 程恒盛 on 2018/3/26.
//  Copyright © 2018年 Herson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LWExtension)
#pragma mark - md5
@property(nonatomic, readonly) NSString *md5;//返回小写md5值
@property(nonatomic, readonly) NSString *MD5;//返回大写md5值




#pragma mark - analysis
/**
 对json格式的字符串进行处理，返回其对应的NSDictionary或者NSArray等对象
 例如：NSString *str = @"{\"name\":\"kaixuan_166\"}";
 @return json对象
 */
- (id)jsonValue;

/**
 string为NSDictionary的json格式

 @return json对应的Dictionary
 */
- (NSDictionary *)jsonDictionary;

/**
 string為NSArray的json格式

 @return json对应的Array
 */
- (NSArray *)jsonArray;




#pragma mark - class methods
/**
 判断是否是手机号码
 @param mobile 手机号字符串
 @return YES or NO
 */
+ (BOOL)valiMobile_lwui:(NSString *)mobile;

/**
 判断是不是有效url
 
 @return YES or NO
 */
+ (BOOL)validURLString_lwui:(NSString *)URLString;

@end
