//
//  NSString+LWExtension.m
//  lwbasic
//
//  Created by 程恒盛 on 2018/3/26.
//  Copyright © 2018年 Herson. All rights reserved.
//

#import "NSString+LWExtension.h"
#import "NSData+LWExtension.h"

@implementation NSString (LWExtension)

-(NSString *)md5{
    NSString *md5 = [self dataUsingEncoding:NSUTF8StringEncoding].md5String;
    return md5;
}
-(NSString *)MD5{
    NSString *MD5 = [self dataUsingEncoding:NSUTF8StringEncoding].MD5String;
    return MD5;
}

- (id)jsonValue{
    if (self.length == 0) return nil;
    NSData *value = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    id objc = [NSJSONSerialization JSONObjectWithData:value options:NSJSONReadingMutableContainers error:&error];
    if (objc==nil&&error!=nil) {
        NSLog(@"%@",error.localizedDescription);
    }
    return objc;
}
- (NSArray *)jsonArray{
    id jsonValue = [self jsonValue];
    if ([jsonValue isKindOfClass:[NSArray class]]) {
        return jsonValue;
    }else{
        return nil;
    }
}
- (NSDictionary *)jsonDictionary{
    id jsonValue = [self jsonValue];
    if ([jsonValue isKindOfClass:[NSDictionary class]]) {
        return jsonValue;
    }else{
        return nil;
    }
}

+ (BOOL)valiMobile_lwui:(NSString *)mobile{
    if (mobile.length != 11)
    {
        return NO;
    }
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[0, 1, 6, 7, 8], 18[0-9]
     * 移动号段: 134,135,136,137,138,139,147,150,151,152,157,158,159,170,178,182,183,184,187,188
     * 联通号段: 130,131,132,145,155,156,170,171,175,176,185,186
     * 电信号段: 133,149,153,170,173,177,180,181,189
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|7[0135678]|8[0-9])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,147,150,151,152,157,158,159,170,178,182,183,184,187,188
     */
    NSString *CM = @"^1(3[4-9]|4[7]|5[0-27-9]|7[08]|8[2-478])\\d{8}$";
    /**
     * 中国联通：China Unicom
     * 130,131,132,145,155,156,170,171,175,176,185,186
     */
    NSString *CU = @"^1(3[0-2]|4[5]|5[56]|7[0156]|8[56])\\d{8}$";
    /**
     * 中国电信：China Telecom
     * 133,149,153,170,173,177,180,181,189
     */
    NSString *CT = @"^1(3[3]|4[9]|53|7[037]|8[019])\\d{8}$";
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobile] == YES)
        || ([regextestcm evaluateWithObject:mobile] == YES)
        || ([regextestct evaluateWithObject:mobile] == YES)
        || ([regextestcu evaluateWithObject:mobile] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
    //旧的正则表达式
    //    if (mobile.length < 11)
    //    {
    //        return NO;
    //    }else{
    //        /**
    //         * 移动号段正则表达式
    //         */
    //        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
    //        /**
    //         * 联通号段正则表达式
    //         */
    //        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
    //        /**
    //         * 电信号段正则表达式
    //         */
    //        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
    //        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
    //        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
    //        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
    //        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
    //        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
    //        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
    //
    //        if (isMatch1 || isMatch2 || isMatch3) {
    //            return YES;
    //        }else{
    //            return NO;
    //        }
    //    }
    //    return YES;
}
+ (BOOL)validURLString_lwui:(NSString *)URLString{
    NSString *regex =@"[a-zA-z]+://[^\\s]*";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [urlTest evaluateWithObject:URLString];
}
@end
