//
//  ViewController.m
//  NuancierRVBGeek
//
//  Created by m2sar on 20/10/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

#import "ViewController.h"
#import "NuancierVue.h"

@interface ViewController ()

@end


@implementation ViewController


NuancierVue *v;
float rouge;
float vert;
float bleu;
float alpha;


//les variables

- (void)viewDidLoad {
    [super viewDidLoad];
    rouge=0.5;
    vert=0.5;
    bleu=0.5;
    alpha=1.0;
    
    //la vue pricipale
    UIScreen *ecran = [UIScreen mainScreen];
    CGRect rect=[ecran bounds];
    v = [[NuancierVue alloc] initWithFrame:rect];
    [v setBackgroundColor:[ UIColor whiteColor]];
    
    [[v enregister] addTarget:self action:@selector(saveAction:) forControlEvents:UIControlEventTouchDown];
    [[v raz] addTarget:self action:@selector(razAction:) forControlEvents:UIControlEventTouchUpInside];
    [[v precedent] addTarget:self action:@selector(PrecAction:) forControlEvents:UIControlEventTouchUpInside];
    [[v penuitieme] addTarget:self action:@selector(PenuitAction:) forControlEvents:UIControlEventTouchUpInside];
    [[v webSwitch] addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    [[v rougeStepper] addTarget:self action:@selector(redAction:) forControlEvents:UIControlEventValueChanged];
    [[v vertStepper] addTarget:self action:@selector(vertAction:) forControlEvents:UIControlEventValueChanged];
    [[v bleuStepper] addTarget:self action:@selector(blueAction:) forControlEvents:UIControlEventValueChanged];
    
    [self setView:v];[v release];
    [self changeActuelView:rouge :vert :bleu];

    
    [self changePrecPenuitView:[UIColor colorWithRed:rouge green:vert blue:bleu alpha:1] :[UIColor colorWithRed:rouge green:vert blue:bleu alpha:1]];

    [self changeRGBstepper:[UIColor colorWithRed:rouge green:vert blue:bleu alpha:1]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)PrecAction:(id)sender {
    [self changeActuelViewUIColor:[[v precedent] backgroundColor] ];
    [self changeRGBstepper:[[v precedent] backgroundColor] ];
}

- (IBAction)PenuitAction:(id)sender {
    [self changeActuelViewUIColor:[[v penuitieme] backgroundColor] ];
    [self changeRGBstepper:[[v penuitieme] backgroundColor] ];
}

- (IBAction)redAction:(id)sender {
    if([[v webSwitch] isOn]){
        int value = (int)[[v rougeStepper] value];
        value=(value-value%10);
        [[v rougeStepper]  setValue:value];
    }
    
    rouge = [[v rougeStepper]  value]/100;
    [[v rougeLab]  setText:[NSString stringWithFormat:@"R : %d %%", (int)(rouge*100)]];
    [self changeActuelView:rouge :vert :bleu];
}

- (IBAction)vertAction:(id)sender {
    if([[v webSwitch] isOn]){
        int value = (int)[[v vertStepper] value];
        value=(value-value%10);
        [[v vertStepper] setValue:value];
    }
    
    vert=[[v vertStepper] value]/100;
    [[v vertLab] setText:[NSString stringWithFormat:@"V : %d %%", (int)(vert*100)]];
    [self changeActuelView:rouge :vert :bleu];
}

- (IBAction)blueAction:(id)sender {
    if([[v webSwitch] isOn]){
        int value = (int)[[v bleuStepper] value];
        value=(value-value%10);
        [[v bleuStepper] setValue:value];
    }
    
    
    bleu=[[v bleuStepper] value]/100;
    [[v bleuLab] setText:[NSString stringWithFormat:@"B : %d %%", (int)(bleu*100)]];
    [self changeActuelView:rouge :vert :bleu];
}

- (IBAction)saveAction:(id)sender {
    [self changePrecPenuitView:[[v actuel] backgroundColor] :[[v precedent] backgroundColor]];
}

- (IBAction)razAction:(id)sender {
    
    rouge=0.5;
    vert=0.5;
    bleu=0.5;
    [self changeActuelView:rouge :vert :bleu];
    [self changePrecPenuitView:[UIColor colorWithRed:rouge green:vert blue:bleu alpha:1] :[UIColor colorWithRed:rouge green:vert blue:bleu alpha:1]];
    [self changeRGBstepper:[UIColor colorWithRed:rouge green:vert blue:bleu alpha:1]];
}

- (IBAction)switchAction:(id)sender {
    if([[v webSwitch]  isOn]){
        [[v rougeLab] setText:[NSString stringWithFormat:@"R : %d %%", [self arrond:(int)(rouge*100)]]];
        [[v vertLab]  setText:[NSString stringWithFormat:@"V : %d %%", [self arrond:(int)(vert*100)]]];
        [[v bleuLab]  setText:[NSString stringWithFormat:@"B : %d %%", [self arrond:(int)(bleu*100)]]];
    }
}

/*
 Autres fonctions
 */

- (void) changeActuelView:(float)red :(float)vert :(float)bleu {
    UIColor *color = [UIColor colorWithRed:red green:vert blue:bleu alpha:1];
    
    [[v actuel] setBackgroundColor:color];
    
    
}

- (void) changeActuelViewUIColor:(UIColor*)color {
    [[v actuel]  setBackgroundColor:color];
    
}

- (void)changePrecPenuitView:(UIColor*)colorPrec :(UIColor*)colorPenuit{
    
    [[v precedent]  setBackgroundColor:colorPrec];
    [[v penuitieme]  setBackgroundColor:colorPenuit];
}

- (void)changeRGBstepper:(UIColor*)color{
    CGFloat Crouge;
    CGFloat Cvert;
    CGFloat Cbleu;
    CGFloat Calpha;
    [color getRed:&Crouge green:&Cvert blue:&Cbleu alpha:&Calpha];
    rouge=(float)Crouge;
    vert=(float)Cvert;
    bleu=(float)Cbleu;
    [[v rougeStepper] setValue:rouge*100];
    [[v rougeLab] setText:[NSString stringWithFormat:@"R : %d %%", (int)(rouge*100)]];
    [[v vertStepper]  setValue:vert*100];
    [[v vertLab] setText:[NSString stringWithFormat:@"V : %d %%", (int)(vert*100)]];
    [[v bleuStepper]  setValue:bleu*100];
    [[v bleuLab] setText:[NSString stringWithFormat:@"B : %d %%", (int)(bleu*100)]];
}

-(int) arrond:(int)val {
    int aux = val;
    if((aux%10)<5){
        aux-=(aux%10);
    }else{
        aux=(((aux/10)+1)*10);
    }
    return aux;
}


@end
