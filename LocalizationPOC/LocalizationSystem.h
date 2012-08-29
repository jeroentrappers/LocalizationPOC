//
//  LocalizationSystem.h
//  POC
//
//  Created by Jeroen Trappers on 28/04/12.
//  Copyright (c) 2012 iCapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define ICLocalizedString(key, comment) \
[[LocalizationSystem shared] localizedStringForKey:(key) value:@"" table:nil]
#define ICLocalizedStringFromTable(key, tbl, comment) \
[[LocalizationSystem shared] localizedStringForKey:(key) value:@"" table:(tbl)]

#define ICLocalizedStringWithDefaultValue(key, tbl, val, comment) \
[[LocalizationSystem shared] localizedStringForKey:(key) value:(val) table:(tbl)]

#define ICLocalizedViewController(class) \
[[LocalizationSystem shared] localizedViewController:(class)]

#define ICLocalizedImage(name) \
[[LocalizationSystem shared] localizedImage:(name)]

#define ICLocalizationSetLanguage(language) \
[[LocalizationSystem shared] setLanguage:(language)]

#define ICLocalizationReset \
[[LocalizationSystem shared] resetLocalization]

@interface LocalizationSystem : NSObject

+ (LocalizationSystem *)shared;

// gets the string localized
- (NSString *)localizedStringForKey:(NSString *)key
                              value:(NSString *)value
                              table:(NSString *)tableName;

// gets instance of viewcontroller with localized nib.
- (id) localizedViewController: (Class) vcClass;

// gets instance of localized image 
- (UIImage *) localizedImage:(NSString *)name;

// sets the language
- (void) setLanguage:(NSString*) language;
- (NSString *) language;

// resets this system.
- (void) resetLocalization;

@end
