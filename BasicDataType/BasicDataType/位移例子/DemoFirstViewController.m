//
//  DemoFirstViewController.m
//  BasicDataType
//
//  Created by L on 2017/8/11.
//  Copyright © 2017年 L. All rights reserved.
//

#import "DemoFirstViewController.h"

typedef NS_OPTIONS(NSUInteger, People) {
    Student = 0,
    Teacher = 1 << 0, // 2的零次方 1     二进制表示 0000 0001
    Worker  = 1 << 1, // 2的一次方 2     二进制表示 0000 0010
    Doctor  = 1 << 2, // 2的二次方 4     二进制表示 0000 0100
};

@interface DemoFirstViewController ()

@end

@implementation DemoFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
}

#pragma mark - 真值,原码,补码,反码

- (void)knowledgePoints {
    
    // 真值和机器数:
    /*
     一个数在计算机中的二进制表示形式,叫做这个数的机器数.机器数是带符号的,在计算机用一个数的最高位存放符号,正数为0,负数为1
     
     e.g 十进制中的数+3,计算机字长度为8位,转换成二进制就是0000 0011
         如果是-3,就是 1000 0011
         这里的0000 0011和1000 0011就是机器数.
     
         因为第一位是符号位,所以机器数的形式值就不等于真正的数值
         例如上面的有符号数1000 0011,其最高位1代表负,其真正数值是-3, 而不是形式值131(1000 0011 转换成十进制131)
     
         所以,为区别起见,将带符号位的机器数对应的真正数值称为机器数的真值。
         例:0000 0001的真值 = +000 0001 = +1, 1000 0001的真值 = –000 0001 = –1
         简单说,计算机中二进制数据要用0 1表示大小和正负,一般将最高位作为符号位,0表示正号,1表示负号,其余位表示数值大小。
         这种在计算机内部将正负号数字化后得到的数称为机器数,而在计算机外部用正负号表示的实际数值,称为机器数表示的真值
     */
    
    // 在计算机内，有符号数有3种表示法：原码、反码和补码。
    // 原码(true form)是一种计算机中对数字的二进制定点表示方法。
    // 原码表示法在数值前面增加了一位符号位（即最高位为符号位）：正数该位为0，负数该位为1（0有两种表示：+0和-0），其余位表示数值的大小。
    // 反码-正数的反码与其原码相同；负数的反码是对其原码逐位取反，但符号位除外。
    // 补码-正数的补码与其原码相同；负数的补码是在其反码的末位加1。
    
    /*
     在计算机系统中，数值一律用补码来表示和存储。
     原因在于，使用补码，可以将符号位和数值域统一处理；同时，加法和减法也可以统一处理。
     此外，补码与原码相互转换，其运算过程是相同的，不需要额外的硬件电路。
     */
    
    #pragma mark 例子
    /*
    正数
    正整数的补码是其二进制表示，与原码相同。
    e.g +9的补码是00001001。原码也是00001001。
     （备注：这个+9的补码是用8位2进制来表示的，补码表示方式很多，还有16位二进制补码表示形式，以及32位二进制补码表示形式,64位进制补码表示形式等。每一种补码表示形式都只能表示有限的数字。）
     */
    
    /*
     负数
     求负整数的补码，将其对应正数二进制表示所有位取反（包括符号位，0变1，1变0）后加1
     同一个数字在不同的补码表示形式中是不同的。
     比如-15的补码，在8位二进制中是11110001，然而在16位二进制补码表示中，就是1111111111110001。以下都使用8位2进制来表示。
     
     e.g 求-5的补码。(原码10000101)
         -5对应正数5（00000101）→所有位取反（11111010(反码)）→加1(11111011)
         所以-5的补码是11111011。
    */
    
}

#pragma mark - 枚举操作 Demo 1

- (void)enumerationOperation {
    
    // unsigned long 输出 0,1,2,4
    
    NSLog(@"%lu, %lu, %lu, %lu", Student, Teacher, Worker, Doctor);
    
    NSLog(@"%lu", Teacher|Worker); // 3
    
    People people = Teacher | Worker;
    
    //检查是否包含某选型
    if ( people & Teacher ){ //0011 & 0001 = 0001
        //包含Teacher
    }else{
        //不包含Teacher
    }
    
    //增加选项
    people = people | Doctor;//0011 | 0100 = 0111,  7
    NSLog(@"%lu", people);
    
    //减少选项
    //    Doctor 100  是4
    //    4 二进制 100，补满 32位
    //    0000 0000 0000 0000 0000 0000 0000 0100
    //    按位取反
    //    1111 1111 1111 1111 1111 1111 1111 1011
    //    由于32位开头第一个是1，所以这是一个负数，将二进制转换成负数，需要先反码
    //    0000 0000 0000 0000 0000 0000 0000 0100
    //    之后，再+1
    //    0000 0000 0000 0000 0000 0000 0000 0101
    //    转换成十进制为5，加上符号变成负数 -5
    //    -5 的原码是1 000 0101反码1 111 1010  补码是1 111 1011(最前面一位是正,负数标志位)

    people = people & (~Doctor);//0111 & (~0100) = 000 0111 & 1111 1011 = 011 , 3
    
    NSLog(@"%lu", people);
}

- (void)randomData {

    // 有效
    __unused Byte buffer_1[10] = {0x12, 0xE0, 0x06, 0xFF, 0x60, 0x22, 0x24, 0x66, 0x00, 0xAF};
    // 无效
    __unused Byte buffer_2[10] = {0x12, 0x60, 0x00, 0x0F, 0x00, 0x00, 0x37, 0x6A, 0x00, 0x00};
    // 溢出
    __unused Byte buffer_3[10] = {0x12, 0x63, 0xFF, 0xFF, 0x40, 0x00, 0x39, 0x98, 0x00, 0x00};
    //测试
    __unused Byte buffer_4[10] = {0x12, 0xE0, 0x06, 0xFF, 0x00, 0x22, 0x37, 0x69, 0x00, 0x27};
    
    [self getDotData:buffer_1];
    
}

- (void)getDotData:(Byte [])buffer {
    
    Byte data[7];
    
    if ((buffer[0]&0xff) != 0x12) { // 标志位不对
        return;
    }
    
    for (int i=0; i<10; i++) {
        NSLog(@"原数据 第%d位是  %hhu", i, buffer[i]);
    }
  
    data[0] = (((buffer[4]&0x1f))<<9)|((buffer[5]&0xff)<<1)|((buffer[6]&0x80)>>7);
    
    data[1] = (buffer[6]&0x7f)*1000/128;  // *1000/128
    
    data[2] = (((buffer[1]&0x03))<<12)|((buffer[2]&0xff)<<4)|((buffer[3]&0xf0)>>4);
    
    data[3] = (((buffer[3]&0x0f)<<3)|((buffer[4]&0xe0)>>5))*1000/128; //*1000/128
    
    data[4] = ((buffer[8]&0x03)<<8)|(buffer[9]&0xff);
    
    data[5] = (buffer[7] + 256)%256;
    
    data[6] = buffer[1] == 0xe0 ? 0x01 : 0x00;
    
    for (int i=0; i<7; i++) {
        NSLog(@"第%d位是  %hhu", i, data[i]);
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
