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

@property (nonatomic, assign) People people;

@end

@implementation DemoFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    //[self randomData];
   
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
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
    
    //增加选项:
    people = people | Doctor;//0011 | 0100 = 0111,  7
    NSLog(@"%lu", people);
    //减少选项
    people = people & (~Doctor);//0111 & (~0100) = 000 0111 & 1111 1011 = 011 , 3
    
    NSLog(@"%d", 7 & -5);
    
    
     // 100  是4
    
//    4 二进制 100，补满 32位
//    0000 0000 0000 0000 0000 0000 0000 0100
//    按位取反
//    1111 1111 1111 1111 1111 1111 1111 1011
//    由于32位开头第一个是1，所以这是一个负数，将二进制转换成负数，需要先反码
//    0000 0000 0000 0000 0000 0000 0000 0100
//    之后，再+1
//    0000 0000 0000 0000 0000 0000 0000 0101
//    转换成十进制为5，加上符号变成负数 -5
//    -5 的原码是1000 0101反码1111 1010  补码是1111 1011
//    计算机中的计算都是补码计算
    
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
    
    if (buffer[0] != 0x12) { // 标志位不对
        return;
    }
    
    for (int i=0; i<10; i++) {
        NSLog(@"原数据 第%d位是  %hhu", i, buffer[i]);
    }
  
    data[0] = (((buffer[4]&0x1f))<<9)|((buffer[5]&0xff)<<1)|((buffer[6]&0x80)>>7);
    
    data[1] = (buffer[6]&0x7f);  // *1000/128
    
    data[2] = (((buffer[1]&0x03))<<12)|((buffer[2]&0xff)<<4)|((buffer[3]&0xf0)>>4);
    
    data[3] = ((buffer[3]&0x0f)<<3)|((buffer[4]&0xe0)>>5); //*1000/128
    
    data[4] = ((buffer[8]&0x03)<<8)|(buffer[9]&0xff);
    
    data[5] = buffer[7];
    
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
