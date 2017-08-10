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
    
    
    [self operator];

    [self developerAppleDescription];
}

#pragma mark - 运算符

- (void)operator {
    
    int a = 0b11110000; //八进制表示方式

    [self testLog:a demoCount:0];
    
    #pragma mark 1,按位或运算  运算符 |
    
    //按位或运算符|比较两个数，然后返回一个新的数，这个数的每一位设置1的条件是两个输入数的同一位都不为0(即任意一个为1，或都为1)。
    int test1_1 = 0b00001111;
    
    // 2个数,有一位是1结果那位数就是1(有一即一)
    int b = a|test1_1; // 结果0b11111111
    
    [self testLog:b demoCount:1];
    
    #pragma mark 2,按位与运算 运算符 &
    
    // 按位与运算符对两个数进行操作，然后返回一个新的数，这个数的每个位都需要两个输入数的同一位都为1时才为1。
    int test2_1 = 0b11111100;
    int test2_2 = 0b00111111;
    
    //2个数,2位同时为1时才为1。(同时一才是一,其它皆为0)
    int c = test2_1&test2_2; // 结果0b00111100
    
    [self testLog:c demoCount:2];
    
    #pragma mark 3,按位异或运算 运算符 ^
    
    // 按位异或运算符^比较两个数，然后返回一个数，这个数的每个位设为1的条件是两个输入数的同一位不同，如果相同就设为0
    int test3_1 = 0b00010100;
    int test3_2 = 0b00000101;
    
    //2个数,同一位,相同的变成0,不同的变成1
    int d = test3_1 ^ test3_2; // 结果0b00010001;
    
    [self testLog:d demoCount:3];
    
    
    #pragma mark 4,按位取反 运算符 ~
    
    
//    0 0 1 0 1 1 1 0    46
//    ———————————————
//    1 1 0 1 0 0 0 1    209
    
    uint z = 0b00001111;
    uint e = ~z;
    
    [self testLog:e demoCount:4];
    
}

- (void)testLog:(int)input demoCount:(int)demoCount {
    NSLog(@"第%d个例子", demoCount);
    NSLog(@"以16进制方式输出: %X", input);
    NSLog(@"以10进制方式输出: %d", input);
    NSLog(@"以8进制方式输出: %o", input);
    NSLog(@"\n");
}

#pragma mark - 数据类型简介及输出,存储空间,取值范围

- (void)basicDataType {
    
    /*
     1. 数据类型简介及输出
     
     (1) 数据类型简介
     
     数据类型简介: Object - C 数据类型 分为 基本数据类型, 构造类型 和 指针类型;
     
     1, 基本数据类型: 整型, 字符型, 浮点型 (float 和 double), 枚举型;
     
     2, 构造类型: 数组类型, 结构体类型, 共用体类型;
     
     3, 指针类型: 最终要的数据类型,所有的系统类, 自定义类都是指针;
     
     4, 空类型: 空类型只有一个值 nil, 该类型没有名称, 因此没有空类型的变量, 变量不能转换成空类型, 但是空类型可以转换成任何引用类型;
     
     (2) 数据类型输出
     
     整型占位符说明: 看developerAppleDescription()
     
     */
    
    /*
     存储空间(64位编译器已试,其它16,32位,及其它编译环境造成的差异待研究)
     
     1个字节(byte)等于8bit("位"或"比特")
     
     数据类型       16位编译器      32位编译器      64位编译器
     char          1byte          1byte         1byte
     int           2byte          4byte         4byte
     float         4byte          4byte         4byte
     double        8byte          8byte         8byte
     short int     2byte          2byte         2byte
     unsigned int  2byte          4byte         4byte
     long          4byte          4byte         8byte
     unsigned long 4byte          4byte         8byte
     long long     8byte          8byte         8byte
     void*(指针变量) 2byte          4byte         8byte
     
     */
    
    /*
     char a;
     int b;
     float c;
     double d;
     short int e;
     unsigned int f;
     long g;
     unsigned long h;
     long long i;
     void *j;
     
     NSLog(@"%lu", sizeof(a));
     NSLog(@"%lu", sizeof(b));
     NSLog(@"%lu", sizeof(c));
     NSLog(@"%lu", sizeof(d));
     NSLog(@"%lu", sizeof(e));
     NSLog(@"%lu", sizeof(f));
     NSLog(@"%lu", sizeof(g));
     NSLog(@"%lu", sizeof(h));
     NSLog(@"%lu", sizeof(i));
     NSLog(@"%lu", sizeof(j));
     */
    
    
    /*
     取值范围  64位编译器环境下
     char  -2^7  ~  2^7 - 1
     short：-2^15 ~ 2^15 - 1
     unsigned short：0 ~ 2^16 - 1
     int   -2^31 ~  2^31 -1
     unsigned int 0 ~ 2^32 - 1
     long： -2^31 ~ 2^31 - 1
     unsigned long：0 ~ 2^32 - 1
     float: FLT_MIN ~ FLT_MAX
     double: DBL_MIN ~ DBL_MAX
     
     
     列出的只是64bit环境下的情况。
     如果你的设备是16bit或者32bit，这些数据类型的取值范围肯定是不一样的。
     比如int类型，在16bit环境下是占用2个字节的，共16bit。
     所以int类型的取值范围是：-2^15 ~ 2^15 - 1。
     */

}


/**
 官网说明
 */

#pragma mark - 格式说明符

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
     
     %d, %D     有符号的32位整数（int）。(十进制整数,d是decimal的缩写)
     
     %u, %U     无符号32位整数（unsigned int）。(十进制无符号整数)
     
     %x         无符号32位整数（unsigned int），使用数字0-9和小写a-f以十六进制打印。(十六进制无符号整数, 没有 0x 前缀)
     
     %X         无符号32位整数（unsigned int），使用数字0-9和大写A-F以十六进制打印。
     
     %o, %O     无符号32位整数（unsigned int），以八进制打印。(八进制无符号整数, 没有 0 前缀)
     
     %f         64位浮点数（double）。(以小数形式输出浮点数, 默认 6 位小数)
     
     %e         64位浮点数（double），以科学记数法打印，使用小写e引入指数。(以指数形式输出浮点数, 默认 6 位小数)
     
     %E         64位浮点数（double），用科学计数法用大写E引入指数。
     
     %g         64位浮点数（double），如果指数小于-4或大于或等于精度，则以％e的样式打印，否则为％f的样式。
                (自动选择 %e 或者 %f 格式)
     
     %G         64位浮点数（double），如果指数小于-4或大于或等于精度，则以％E的样式打印，否则以％f的样式。
     
     %c         8位无符号字符（unsigned char）。(单个字符输出)
     
     %C         16位UTF-16代码单元（unichar）。
     
     %s         8位无符号字符的Null终止数组。( 输出字符串)
                因为％s说明符会导致系统默认编码中的字符被解释，所以结果可以是变量的，特别是从右到左的语言。
                例如，使用RTL时，％s在字符不是强定向时插入方向标记。 因此，最好避免％s并明确指定编码。
     
     %S         16位UTF-16代码单元的Null端接阵列。
     
     %p         无效指针（void *），以数字0-9和小写a-f以十六进制打印，带前缀0x。(输出十六进制形式的指针地址)
     
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
     
     CGFloat          %f or %g              ％f适用于浮动和双精度格式化; 但请注意下面介绍的sscanf。
     
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



@end
