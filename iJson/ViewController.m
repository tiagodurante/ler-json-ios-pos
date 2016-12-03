//
//  ViewController.m
//  iJson
//
//  Created by Faculdade Alfa on 03/12/16.
//  Copyright (c) 2016 Tiago Amado Durante. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize tabela, listaDados, listaImagens;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)carregarDados {
    NSError *erro;
    @try {
        // instancia o link para baixar o .json
        NSURL *url = [NSURL URLWithString:@"http://www.marcosdiasvendramini.com.br/Get/Estereogramas.aspx"];
        // carrega os dados retornado pela url
        NSData *data = [NSData dataWithContentsOfURL:url];
        // serializando os dados
        listaDados = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&erro];
        
        for (int cont = 0; cont< listaDados.count; cont++) {
            //carregando uma imagem
            [listaImagens addObject:[UIImage imageNamed:@"imagem.png"]]
        }
        
        [tabela reloadData];
    }
    @catch (NSException *exception) {
        <#Handle an exception thrown in the @try block#>
    }
    @finally {
        <#Code that gets executed whether or not an exception is thrown#>
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
