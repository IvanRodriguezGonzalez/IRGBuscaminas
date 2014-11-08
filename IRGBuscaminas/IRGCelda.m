//
//  IRGCelda.m
//  IRGDibujar
//
//  Created by Ivan Rodriguez Gonzalez on 26/10/14.
//  Copyright (c) 2014 IvanRodriguez. All rights reserved.
//

#import "IRGCelda.h"
#define TAMANO_X_DEL_NUMERO 10
#define TAMANO_Y_DEL_NUMERO 10

@interface IRGCelda ()


@property (nonatomic,readonly) float posicionX;
@property (nonatomic,readonly) float posicionY;


@end

@implementation IRGCelda

#pragma mark - Inicializadores

- (instancetype) initWithFrame:(CGRect)frame{
    return [self initWithFrame:frame
                 colorDelBorde:[UIColor redColor]
                grosorDelTrazo:1];
}


//designated initializer
- (instancetype) initWithFrame:(CGRect)frame
                 colorDelBorde:(UIColor *)colorDelBorde
                grosorDelTrazo:(NSUInteger) grosorDelTrazo; {

    self = [super initWithFrame:frame];
    if (self){
        _colorDelBorde = colorDelBorde;
        _grosorDelTrazoDeLaCelda = grosorDelTrazo;

        CGRect frame = CGRectMake(6 ,0, self.frame.size.width -12, self.frame.size.height-2);
        UILabel * numeroDeMinasAlrededor = [[UILabel alloc] initWithFrame:frame];
        [numeroDeMinasAlrededor setAdjustsFontSizeToFitWidth:true];

        CGRect frame1 = CGRectMake(1, 1, self.frame.size.width-2,self.frame.size.height-2);
        UIImage *imagen =nil;
        UIImageView * imagenDeMina  = [[UIImageView alloc]initWithImage:imagen];
        imagenDeMina.frame = frame1;
        
        [self addSubview:numeroDeMinasAlrededor];
        [self addSubview:imagenDeMina];
        
        self.numeroDeMinasAlrededor = numeroDeMinasAlrededor;
        self.imagenDeMina = imagenDeMina;
    }
    return self;
}

# pragma mark - Overrides



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds ];
    [self.colorDelBorde setStroke];
    path.lineWidth = self.grosorDelTrazoDeLaCelda;
    [path stroke];
}

# pragma mark - Accesors
-(float) posicionX{
    return self.frame.origin.x;
}

-(float) posicionY{
    return self.frame.origin.y;
}

@end
