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
    
    if (buffer[0] != 0x12) {
        return;
    }
  
    data[6] = buffer[1] == 0xE0 ? 0x01 : 0x00;
    
    data[2] = (((buffer[1]&0x03))<<12)|((buffer[2]&0xff)<<4)|((buffer[3]&0xf0)>>4);
    
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
