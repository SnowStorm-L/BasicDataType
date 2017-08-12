//
//  DemoFirstViewController.m
//  BasicDataType
//
//  Created by L on 2017/8/11.
//  Copyright © 2017年 L. All rights reserved.
//

#import "DemoFirstViewController.h"

@interface DemoFirstViewController ()

@end

@implementation DemoFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self randomData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
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
  
    data[0] = (((buffer[4]&0x1f))<<9)|((buffer[5]&0xff)<<1)|((buffer[6]&0x80)>>7);
    
    data[1] = (buffer[6]&0x7f);  // *1000/128
    
    data[2] = (((buffer[1]&0x03))<<12)|((buffer[2]&0xff)<<4)|((buffer[3]&0xf0)>>4);
    
    data[3] = ((buffer[3]&0x0f)<<3)|((buffer[4]&0xe0)>>5); //*1000/128
    
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
