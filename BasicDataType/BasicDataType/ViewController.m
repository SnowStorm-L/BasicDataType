//
//  ViewController.m
//  BasicDataType
//
//  Created by L on 2017/8/9.
//  Copyright © 2017年 L. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   
    
    /*
    1. 数据类型简介及输出
    
    (1) 数据类型简介
    
    数据类型简介: Object - C 数据类型 分为 基本数据类型, 构造类型 和 指针类型;
    
    1, 基本数据类型: 整型, 字符型, 浮点型 (float 和 double), 枚举型;
    
    2, 构造类型: 数组类型, 结构体类型, 共用体类型;
    
    3, 指针类型: 最终要的数据类型,所有的系统类, 自定义类都是指针;
    
    3, 空类型: 空类型只有一个值 nil, 该类型没有名称, 因此没有空类型的变量, 变量不能转换成空类型, 但是空类型可以转换成任何引用类型;
    
    (2) 数据类型输出
     
     整型占位符说明:
     
     1, %d: 十进制整数, 正数无符号, 负数有 "-" 符号(d是decimal的缩写)(有符号的32位整数（int）);
     
     2, %o: 八进制无符号整数, 没有 0 前缀(无符号32位整数（unsigned int），以八进制打印);
     
     3, %x: 十六进制无符号整数, 没有 0x 前缀;
     
     4, %u: 十进制无符号整数;
    */
    
    int a = -1;
    
    NSLog(@"%d", a);
    
    [self developerAppleDescription];
    
}


/**
 官网说明
 */
- (void)developerAppleDescription {
    
    // https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html
    
    /*
     字符串格式说明符
     
     本文总结了字符串格式化方法和函数支持的格式说明符。
     
     格式说明符
     
     NSString格式化方法和CFString格式化函数支持的格式说明符遵循IEEE printf规范;
     说明符总结在表1中。请注意，您还可以使用“n $”位置说明符，例如％1 $ @％2 $ s。
     有关更多详细信息，请参阅IEEE printf规范。
     您还可以使用NSLog功能的这些格式说明符。
     */
    
    /*
     表1 NSString格式化方法和CFString格式化函数支持的格式说明符
     
     符          描述
     
     %@         Objective-C对象，以descriptionWithLocale返回的字符串打印：如果可用，否则为其他描述。
                还可以使用CFTypeRef对象，返回CFCopyDescription函数的结果。
     
     %%         '％'字符。
     %d, %D     有符号的32位整数（int）。
     %u, %U     无符号32位整数（unsigned int）。
     %x         无符号32位整数（unsigned int），使用数字0-9和小写a-f以十六进制打印。
     %X         无符号32位整数（unsigned int），使用数字0-9和大写A-F以十六进制打印。
     %o, %O     无符号32位整数（unsigned int），以八进制打印。
     %f         64位浮点数（double）。
     %e         64位浮点数（double），以科学记数法打印，使用小写e引入指数。
     %E         64位浮点数（double），用科学计数法用大写E引入指数。
     %g         64位浮点数（double），如果指数小于-4或大于或等于精度，则以％e的样式打印，否则为％f的样式。
     %G         64位浮点数（double），如果指数小于-4或大于或等于精度，则以％E的样式打印，否则以％f的样式。
     %c         8位无符号字符（unsigned char）。
     %C         16位UTF-16代码单元（unichar）。
     %s         8位无符号字符的Null终止数组。
                因为％s说明符会导致系统默认编码中的字符被解释，所以结果可以是变量的，特别是从右到左的语言。
                例如，使用RTL时，％s在字符不是强定向时插入方向标记。 因此，最好避免％s并明确指定编码。
     %S         16位UTF-16代码单元的Null端接阵列。
     %p         无效指针（void *），以数字0-9和小写a-f以十六进制打印，带前缀0x。
     %a         64位浮点数（double），以科学记数法打印，前缀0x和小数点前的十六进制数字使用小写p来引入指数。
     %A         64位浮点数（double），以科学记数法打印，使用大写P引入指数前，使用小数点前的0X和十六进制数字。
     %F         64位浮点数（double），以十进制格式打印。
     */
    
    /*
     表2 NSString格式化方法和CFString格式化函数支持的长度修饰符
     
     长度修饰符        描述
     h          长度修饰符指定以下d，o，u，x或X转换说明符适用于短或无符号短参数。
     hh         长度修饰符指定以下d，o，u，x或X转换说明符适用于带符号的char或unsigned char参数。
     l          长度修饰符指定以下d，o，u，x或X转换说明符适用于long或unsigned long参数。
     ll, q      长度修饰符指定以下d，o，u，x或X转换说明符适用于long long或unsigned long long参数。
     L          长度修饰符指定以下a，A，e，E，f，F，g或G转换说明符适用于长双参数。
     z          长度修饰符指定以下d，o，u，x或X转换说明符适用于size_t。
     t          长度修饰符指定以下d，o，u，x或X转换说明符适用于ptrdiff_t。
     j          长度修饰符指定以下d，o，u，x或X转换说明符适用于intmax_t或uintmax_t参数。
     */
    
    /*
     
     平台依赖关系
     
     OS X使用几种数据类型NSInteger，NSUInteger，CGFloat和CFIndex来提供在32位和64位环境中表示值的一致方法。 
     在32位环境中，NSInteger和NSUInteger分别定义为int和unsigned int。 
     在64位环境中，NSInteger和NSUInteger分别被定义为long和unsigned long。 
     为了避免根据平台使用不同的printf样式类型说明符，可以使用表3中所示的说明符。
     请注意，在某些情况下，您可能需要转换该值。
     
     */
    
    /*
     表3数据类型的格式说明符
     
     类型             格式说明符               注意事项
     NSInteger        %ld or %lx            将值转换为long。
     NSUInteger       %lu or %lx            将值转换为unsigned long.
     CGFloat          %f or %g              ％f适用于浮动和双精度格式化; 但请注意下面介绍的扫描技术。
     CFIndex          %ld or %lx            和NSInteger一样。
     pointer          %p or %zx             ％p将0x添加到输出的开头。如果不希望这样，请使用％zx并且没有typecast。
     
     */
    
   //以下示例说明了使用％ld格式化NSInteger和使用转换。
    
    NSInteger i = 42;
    printf("%ld\n", (long)i);
    
    /*
     除了表3中提到的注意事项外，扫描还有一个额外的情况：您必须区分float和double的类型。 
     您应该使用％f为float，％lf为double。 
     如果您需要使用CGFloat的scanf（或其变体），请切换到double，然后将double复制到CGFloat。
     */
    
    CGFloat imageWidth;
    double tmp;
    char str = 'a';
    sscanf (&str, "%lf", &tmp);
    imageWidth = tmp;
    /*
     重要的是要记住，％lf在32位或64位平台上不能正确表示CGFloat。 
     这与％ld不同，在所有情况下都可以使用。
     */
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
