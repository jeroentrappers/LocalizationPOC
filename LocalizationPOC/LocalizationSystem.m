//
//  LocalizationSystem.h
//  POC
//
//  Created by Jeroen Trappers on 28/04/12.
//  Copyright (c) 2012 iCapps. All rights reserved.
//

#import "LocalizationSystem.h"

@interface LocalizationSystem ()

@property (nonatomic, strong) NSArray /* <NSBundle> */ *bundles;

@end

@implementation LocalizationSystem

@synthesize bundles = _bundles;

+ (LocalizationSystem *)shared
{
    __strong static LocalizationSystem *_sharedLocalSystem = nil;
    
    static dispatch_once_t pred = 0;
    dispatch_once(&pred, ^{
        _sharedLocalSystem = [[self alloc] initPrivate];
    });
    return _sharedLocalSystem;
    
}

- (id) initPrivate
{
    self = [super init];
    if(self)
    {
        NSString *language = [[NSUserDefaults standardUserDefaults] objectForKey:@"ICPreferredLanguage"];
        if ( language && ![language isEqualToString:@""] )
        {
            [self setLanguage:language];
        }
        else {
            [self resetLocalization]; // use default bundle
        }
    }
    return self;
}

- (id)init
{
    @throw @"Please use the singleton.";
}

// Gets the current localized string as in NSLocalizedString.
- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName;
{
    NSString *msg = nil;
    for( NSBundle *bundle in self.bundles )
    {
        msg = [bundle localizedStringForKey:key value:value table:tableName];
        
        if( ![msg isEqualToString:key] && ![msg isEqualToString:value])
        {
            return msg;
        }
        
    }
    return msg;
}

- (id) localizedViewController: (Class) vcClass
{
    NSString *xibName = NSStringFromClass(vcClass);
    for( NSBundle *bundle in self.bundles )
    {
        if(nil != [bundle pathForResource:xibName ofType:@"nib"])
        {
            return [[vcClass alloc]initWithNibName:xibName bundle:bundle];
        }
    }
    return [[vcClass alloc]init];
}

- (UIImage *)localizedImage:(NSString *)name
{
    NSString *pathExtension = [name pathExtension];
    if(!pathExtension || [pathExtension isEqualToString:@""]) {
        pathExtension = @"png"; // png is default :-)
    }
    NSString *fileName = [name stringByDeletingPathExtension];
    
    for( NSBundle *bundle in self.bundles )
    {
        NSString *path = [bundle pathForResource:fileName ofType:pathExtension];
        
        if(nil != path)
        {
            return [[UIImage alloc]initWithContentsOfFile:path];
        }
    }
    return nil;
}


- (NSMutableArray *) preferredLanguages
{
    NSMutableArray *appleLangs = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"]];
    
    return appleLangs;
}

// Sets the desired language of the ones you have.
// LocalizationSetLanguage(@"en");
// LocalizationSetLanguage(@"nl");
// LocalizationSetLanguage(@"fr");
- (void) setLanguage:(NSString*) language
{
    NSMutableArray *appleLangs = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"]];
    
    [appleLangs removeObject:language];
    [appleLangs insertObject:language atIndex:0];
    
    [[NSUserDefaults standardUserDefaults] setObject:appleLangs forKey:@"AppleLanguages"];
    [[NSUserDefaults standardUserDefaults] synchronize]; // needs a restart.
    
    
    [[NSUserDefaults standardUserDefaults] setObject:language forKey:@"ICPreferredLanguage"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSMutableArray *languages = [[NSMutableArray alloc]initWithCapacity:3];
	
	NSString *path = [[NSBundle mainBundle]
                      pathForResource:language ofType:@"lproj" ];
    if (nil != path)
    {
        [languages addObject:[NSBundle bundleWithPath:path]];
    }
    
	if ([language rangeOfString:@"-"].location != NSNotFound) // try the neutral culture bundle
    {
		language = [[language componentsSeparatedByString:@"-"]objectAtIndex:0];
        // fallback
        path = [[NSBundle mainBundle]
                pathForResource:language ofType:@"lproj" ];
        if (nil != path)
        {
            [languages addObject:[NSBundle bundleWithPath:path]];
        }
    }
    
    [languages addObject:[NSBundle mainBundle]];
    self.bundles = languages;
}

- (NSString *) language
{
    NSString *lang = [[NSUserDefaults standardUserDefaults]
                      objectForKey:@"ICPreferredLanguage"];
    if( nil == lang)
    {
        NSMutableArray *appleLangs = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"]];
        
        lang = [appleLangs objectAtIndex:0];
    }
    
    return lang;
}


// Resets the localization system, so it uses the OS default language.
- (void) resetLocalization
{
	self.bundles = [[NSArray alloc]initWithObjects:[NSBundle mainBundle], nil];
}


@end
