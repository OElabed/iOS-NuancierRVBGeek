//
//  NuancierVue.h
//  NuancierRVBGeek
//
//  Created by m2sar on 20/10/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

#import "UIKit/UIKit.h"


@interface NuancierVue : UIView

@property (retain, nonatomic) IBOutlet  UIButton *precedent;
@property (retain, nonatomic) IBOutlet  UIButton *penuitieme;
@property (retain, nonatomic) IBOutlet  UIButton *enregister;
@property (retain, nonatomic) IBOutlet  UIButton *raz;

@property (retain, nonatomic) IBOutlet UISlider *rougeStepper;
@property (retain, nonatomic) IBOutlet UISlider *vertStepper;
@property (retain, nonatomic) IBOutlet UISlider *bleuStepper;

@property (retain, nonatomic) IBOutlet UIView *actuel;

@property (retain, nonatomic) IBOutlet UILabel *precedentLab;
@property (retain, nonatomic) IBOutlet UILabel *penuitiemeLab;
@property (retain, nonatomic) IBOutlet UILabel *actuelLab;
@property (retain, nonatomic) IBOutlet UILabel *rougeLab;
@property (retain, nonatomic) IBOutlet UILabel *vertLab;
@property (retain, nonatomic) IBOutlet UILabel *bleuLab;
@property (retain, nonatomic) IBOutlet UILabel *webuniqueLab;

@property (retain, nonatomic) IBOutlet UISwitch *webSwitch;

@end