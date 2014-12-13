//
//  NuancierVue.m
//  NuancierRVBGeek
//
//  Created by m2sar on 20/10/2014.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

#import "NuancierVue.h"


@implementation NuancierVue

-(id)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
     
        
        
        
        //la vue actuel
        _actuel = [[UIView alloc] init];
        //[_actuel setBackgroundColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1]];
        
        //la vue precédent
        _precedent = [[UIButton alloc] init];
        _precedent = [UIButton buttonWithType:UIButtonTypeSystem];
        [_precedent setTitle:@"" forState:UIControlStateNormal];
        //[_precedent setBackgroundColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1]];
        
        //la vue penuitiéme
        _penuitieme = [[UIButton alloc] init];
        _penuitieme = [UIButton buttonWithType:UIButtonTypeSystem];
        [_penuitieme setTitle:@"" forState:UIControlStateNormal];
        //[_penuitieme setBackgroundColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1]];
        
        //la bouton enregistrer
        _enregister = [[UIButton alloc] init];
        _enregister = [UIButton buttonWithType:UIButtonTypeSystem];
        [_enregister setTitle:@"Enregistrer" forState:UIControlStateNormal];
        
        
        //la bouton raz
        _raz = [[UIButton alloc] init];
        _raz = [UIButton buttonWithType:UIButtonTypeSystem];
        [_raz setTitle:@"RaZ" forState:UIControlStateNormal];
        
        
        //le stepper du rouge
        _rougeStepper = [[UISlider alloc] init];
        [_rougeStepper setMaximumValue:100.0];
        [_rougeStepper setMinimumValue:0.0];
        [_rougeStepper setValue:50.0];
        
        _rougeLab =[[UILabel alloc] init];
        [_rougeLab setText:@"R : 50 %"];
        [_rougeLab sizeToFit];
        
        
        //le stepper du vert
        _vertStepper = [[UISlider alloc] init];
        [_vertStepper setMaximumValue:100.0];
        [_vertStepper setMinimumValue:0.0];
        [_vertStepper setValue:50.0];
        
        _vertLab =[[UILabel alloc] init];
        [_vertLab setText:@"V : 50 %"];
        [_vertLab sizeToFit];
        
        
        //le stepper du bleu
        _bleuStepper = [[UISlider alloc] init];
        [_bleuStepper setMaximumValue:100.0];
        [_bleuStepper setMinimumValue:0.0];
        [_bleuStepper setValue:50.0];
        
        _bleuLab =[[UILabel alloc] init];
        [_bleuLab setText:@"B : 50 %"];
        [_bleuLab sizeToFit];
        
        //les Labels
        
        _webuniqueLab = [[UILabel alloc ] init];
        [_webuniqueLab setText:@"Web uniquement"];
        [_webuniqueLab setTextColor:[UIColor blackColor]];
        [_webuniqueLab sizeToFit];
        
        _actuelLab = [[UILabel alloc ] init];
        [_actuelLab setText:@"Actuel"];
        [_actuelLab setTextAlignment:NSTextAlignmentCenter];
        [_actuelLab sizeToFit];
        
        _precedentLab = [[UILabel alloc ] init];
        [_precedentLab setText:@"Précedent"];
        [_precedentLab setTextColor:[UIColor blackColor]];
        [_precedentLab sizeToFit];
        
        [_penuitiemeLab sizeToFit];
        _penuitiemeLab = [[UILabel alloc ] init];
        [_penuitiemeLab setText:@"Pénuitiéme"];
        [_penuitiemeLab sizeToFit];
       
        
        
        //le switch
        _webSwitch =[[UISwitch alloc] init];
        [_webSwitch setOn:true];
        
        //ajouter tous les bouton dans la vue
        [self addSubview:_actuel];[_actuel release];
        [self addSubview:_penuitieme];[_penuitieme release];
        [self addSubview:_precedent];[_precedent release];
        [self addSubview:_enregister];[_enregister release];
        [self addSubview:_raz];[_raz release];
        [self addSubview:_webSwitch];[_webSwitch release];
        [self addSubview:_rougeStepper];[_rougeStepper release];
        [self addSubview:_vertStepper];[_vertStepper release];
        [self addSubview:_bleuStepper];[_bleuStepper release];
        [self addSubview:_actuelLab];[_actuelLab release];
        [self addSubview:_penuitiemeLab];[_penuitiemeLab release];
        [self addSubview:_precedentLab];[_precedentLab release];
        [self addSubview:_rougeLab];[_rougeLab release];
        [self addSubview:_vertLab];[_vertLab release];
        [self addSubview:_bleuLab];[_bleuLab release];
        [self addSubview:_webuniqueLab];[_webuniqueLab release];

        
        
    }
    return self;
}

-(void) drawRect:(CGRect)rect {
    int x,y;
    UIDevice *terminal = [UIDevice currentDevice];
    x=20;
    y=28;
    if ([terminal userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
        //c'est iphone
        if ([terminal orientation]==UIDeviceOrientationPortrait || [terminal orientation]==UIDeviceOrientationPortraitUpsideDown) {
            //c'est en portrait
            //precedentView
            
            
            [_precedent setFrame:CGRectMake(x, y, 100, 30)];
            [_precedentLab setFrame:CGRectMake(rect.size.width - _precedentLab.frame.size.width - 20, y+5, _precedentLab.frame.size.width, _precedentLab.frame.size.height)];
            
            
            //y=y+_precedent.frame.size.height+10;
            
            y += 40;
            //pentitiéme View
            [_penuitieme setFrame:CGRectMake(x, y, 100, 30)];
            [_penuitiemeLab setFrame:CGRectMake(rect.size.width - _penuitiemeLab.frame.size.width- 20, y+5, _penuitiemeLab.frame.size.width, _penuitiemeLab.frame.size.height)];
            //y=y+_penuitieme.frame.size.height+10;
            
            y += 40;
            //Actuel
            [_actuelLab setFrame:CGRectMake((rect.size.width/2 - (49/2)), y, 49, 21)];
            
            //y+=_actuelLab.frame.size.height+10;
            
            y += 40;
            
            [_actuel setFrame:CGRectMake(x, y, rect.size.width-40, 30)];
            y+=_actuel.frame.size.height+15;
            //slider Rouge
            
            [_rougeLab setFrame:CGRectMake(x, y, _rougeLab.frame.size.width, _rougeLab.frame.size.height)];
            y+=_rougeLab.frame.size.height+5;
            [_rougeStepper setFrame:CGRectMake(x, y, rect.size.width-40, _rougeStepper.frame.size.height)];
            y+=_rougeStepper.frame.size.height+5;
            
            //slider Vert
            
            [_vertLab setFrame:CGRectMake(x, y, _vertLab.frame.size.width, _vertLab.frame.size.height)];
            y+=_rougeLab.frame.size.height+5;
            [_vertStepper setFrame:CGRectMake(x, y, rect.size.width-40, _vertStepper.frame.size.height)];
            y+=_vertStepper.frame.size.height+5;
            
            //slider bleu
            [_bleuLab setFrame:CGRectMake(x, y, _bleuLab.frame.size.width, _bleuLab.frame.size.height)];
            y+=_rougeLab.frame.size.height+5;
            [_bleuStepper setFrame:CGRectMake(x, y, rect.size.width-40, _bleuStepper.frame.size.height)];
            y+=_bleuStepper.frame.size.height;
            
            //switch web
            y=rect.size.height-20;
            [_webuniqueLab setFrame:CGRectMake(rect.size.width - _webuniqueLab.frame.size.width -20, y-_webuniqueLab.frame.size.height, _webuniqueLab.frame.size.width, _webuniqueLab.frame.size.height)];
            y-=_webuniqueLab.frame.size.height;
            [_webSwitch setFrame:CGRectMake(rect.size.width-_webSwitch.frame.size.width-20, y-_webSwitch.frame.size.height, _webSwitch.frame.size.width, _webSwitch.frame.size.height)];
            y-=(_webSwitch.frame.size.height/2);
            
            //Bouton enregistrer
            y-=15;
            [_enregister setFrame:CGRectMake(x, y, 74, 30)];
            //Boutton raz
            [_raz setFrame:CGRectMake((rect.size.width/2 -30/2), y, 30, 30)];
        }
        else if ([terminal orientation]==UIDeviceOrientationLandscapeLeft || [terminal orientation]== UIDeviceOrientationLandscapeRight){ //paysage
            x=16;
            y=28;
            //precedent View
            [_precedent setFrame:CGRectMake(x, y, 100, 30)];
            //penuitiéme View
            x+=_precedent.frame.size.width+8;
            [_penuitieme setFrame:CGRectMake(x, y, 100, 30)];
            //Actuel
            x+=_penuitieme.frame.size.width+8;
            [_actuel setFrame:CGRectMake(x, y, rect.size.width-16-x, 30)];
            
            
            //les labels actuel,penuit, precedent
            y+=_precedent.frame.size.height+8;
            
            x=_precedent.frame.origin.x+_precedent.frame.size.width/2 - _precedentLab.frame.size.width/2;
            [_precedentLab setFrame:CGRectMake(x, y, _precedentLab.frame.size.width, _precedentLab.frame.size.height)];
            
            x=_penuitieme.frame.origin.x+_penuitieme.frame.size.width/2 - _penuitiemeLab.frame.size.width/2;
            [_penuitiemeLab setFrame:CGRectMake(x, y, _penuitiemeLab.frame.size.width, _penuitiemeLab.frame.size.height)];
            
            x=_actuel.frame.origin.x + _actuel.frame.size.width/2 - _actuelLab.frame.size.width/2;
            [_actuelLab setFrame:CGRectMake(x, y, _actuelLab.frame.size.width, _actuelLab.frame.size.height)];
            
            
            //Rouge Slider
            y+=_actuelLab.frame.size.height+8;
            x=16;
            [_rougeLab setFrame:CGRectMake(x, y, _rougeLab.frame.size.width, _rougeLab.frame.size.height)];
            y+=_rougeLab.frame.size.height;
            x=14;
            [_rougeStepper setFrame:CGRectMake(x, y, rect.size.width-14*2, _rougeStepper.frame.size.height)];
            
            
            //vert slider
            y+=_rougeStepper.frame.size.height;
            x=16;
            [_vertLab setFrame:CGRectMake(x, y, _vertLab.frame.size.width, _vertLab.frame.size.height)];
            y+=_vertLab.frame.size.height;
            x=14;
            [_vertStepper setFrame:CGRectMake(x, y, rect.size.width-14*2, _vertStepper.frame.size.height)];
            
            
            //bleuslider
            y+=_vertStepper.frame.size.height;
            x=16;
            [_bleuLab setFrame:CGRectMake(x, y, _bleuLab.frame.size.width, _bleuLab.frame.size.height)];
            y+=_bleuLab.frame.size.height;
            x=14;
            [_bleuStepper setFrame:CGRectMake(x, y, rect.size.width-14*2, _bleuStepper.frame.size.height)];
            
            //Switch
            x=rect.size.width-16-_webSwitch.frame.size.width;
            y=rect.size.height-20-_webSwitch.frame.size.height;
            [_webSwitch setFrame:CGRectMake(x, y, _webSwitch.frame.size.width, _webSwitch.frame.size.height)];
           
            //webuniquement
            x-=_webuniqueLab.frame.size.width+5;
            y=_webSwitch.frame.origin.y+_webSwitch.frame.size.height/2-_webuniqueLab.frame.size.height/2;
            [_webuniqueLab setFrame:CGRectMake(x, y, _webuniqueLab.frame.size.width, _webuniqueLab.frame.size.height)];
            
            //Enregistrer
            y=_webuniqueLab.frame.origin.y+_webuniqueLab.frame.size.height/2-30/2;
            x=16;
            [_enregister setFrame:CGRectMake(x, y, 74, 30)];
            
            //RaZ
            [_raz setFrame:CGRectMake((rect.size.width/2 -30/2), y, 30, 30)];
            
            
        }
    }
    else if ([terminal orientation]==UIDeviceOrientationPortrait || [terminal orientation]== UIDeviceOrientationPortraitUpsideDown || [terminal orientation]==UIDeviceOrientationLandscapeLeft || [terminal orientation]== UIDeviceOrientationLandscapeRight){
        
        //precedent
        x=16;
        y=28;
        [_precedent setFrame:CGRectMake(x, y, 200, 40)];
        
        //penuitiéme
        x=rect.size.width-16-_precedent.frame.size.width;
        [_penuitieme setFrame:CGRectMake(x, y, 200, 40)];
        
        //precedentLab
        y+=_precedent.frame.size.height+8;
        x=_precedent.frame.origin.x+_precedent.frame.size.width/2 - _precedentLab.frame.size.width/2;
        [_precedentLab setFrame:CGRectMake(x, y, _precedentLab.frame.size.width, _precedentLab.frame.size.height)];
        
        //penuitiémeLab
        
        x=_penuitieme.frame.origin.x+_penuitieme.frame.size.width/2 - _penuitiemeLab.frame.size.width/2;
        [_penuitiemeLab setFrame:CGRectMake(x, y, _penuitiemeLab.frame.size.width, _penuitiemeLab.frame.size.height)];
        
        //ActuelLab
        
        y+=_precedentLab.frame.size.height+20;
        x=rect.size.width/2 - (_actuelLab.frame.size.width/2);
        [_actuelLab setFrame:CGRectMake(x, y, _actuelLab.frame.size.width, _actuelLab.frame.size.height)];
        
        //Actuel
        y+=_actuelLab.frame.size.height+8;
        x=16;
        if ([terminal orientation]== UIDeviceOrientationLandscapeLeft || [terminal orientation]== UIDeviceOrientationLandscapeRight ) {
            [_actuel setFrame:CGRectMake(x, y, rect.size.width-(16*2),rect.size.height/2-y)];
        } else {
            [_actuel setFrame:CGRectMake(x, y, rect.size.width-(16*2), (rect.size.height/2-y)+((rect.size.height/2-y)/3))];
        }
        
        
        //rouge Slider & lab
        y+=_actuel.frame.size.height+15;
        [_rougeLab setFrame:CGRectMake(x, y, _rougeLab.frame.size.width, _rougeLab.frame.size.height)];
        y+=_rougeLab.frame.size.height;
        x=14;
        [_rougeStepper setFrame:CGRectMake(x, y, rect.size.width-14*2, _rougeStepper.frame.size.height)];
        
        //vert slider
        y+=_rougeStepper.frame.size.height;
        x=16;
        [_vertLab setFrame:CGRectMake(x, y, _vertLab.frame.size.width, _vertLab.frame.size.height)];
        y+=_vertLab.frame.size.height;
        x=14;
        [_vertStepper setFrame:CGRectMake(x, y, rect.size.width-14*2, _vertStepper.frame.size.height)];
        
        
        //bleuslider
        y+=_vertStepper.frame.size.height;
        x=16;
        [_bleuLab setFrame:CGRectMake(x, y, _bleuLab.frame.size.width, _bleuLab.frame.size.height)];
        y+=_bleuLab.frame.size.height;
        x=14;
        [_bleuStepper setFrame:CGRectMake(x, y, rect.size.width-14*2, _bleuStepper.frame.size.height)];
        
        //switch
        y=rect.size.height-20;
        [_webuniqueLab setFrame:CGRectMake(rect.size.width - _webuniqueLab.frame.size.width -14, y-_webuniqueLab.frame.size.height, _webuniqueLab.frame.size.width, _webuniqueLab.frame.size.height)];
        y-=_webuniqueLab.frame.size.height;
        [_webSwitch setFrame:CGRectMake(rect.size.width-_webSwitch.frame.size.width-14, y-_webSwitch.frame.size.height, _webSwitch.frame.size.width, _webSwitch.frame.size.height)];
        

        
        //Enregistrer
        y-=(_webSwitch.frame.size.height/2);
        x=_precedentLab.frame.origin.x+_precedentLab.frame.size.width/2 - _precedentLab.frame.size.width/2;
        [_enregister setFrame:CGRectMake(x, y, 74, 30)];

        //raz
        [_raz setFrame:CGRectMake((rect.size.width/2 -30/2), y, 30, 30)];
        
    
    
    
    
    }
    
    
}



@end