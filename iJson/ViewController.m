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
    listaImagens = [[NSMutableArray alloc] init];
    // chama o carregarDados em thread
    [self performSelector:@selector(carregarDados) withObject:nil];
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
            [listaImagens addObject:[UIImage imageNamed:@"imagem.png"]];
        }
        
        [tabela reloadData];
    }
    @catch (NSException *exception) {
 
    }
    @finally {
 
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return listaDados.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //criando uma celula a partir do modelo da tela
    UITableViewCell *celula = [tableView dequeueReusableCellWithIdentifier:@"Celula"];
    //caso a celula nao tenha sido iniciada, ele vai criar uma com o estilo default
    if (celula == nil) {
        celula = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Celula"];
    }
    //verificando se existe a posição da linha atual no array
    if ([listaDados objectAtIndex:indexPath.row] != nil) {
        //carregando o dicionario de dados do item do array
        NSDictionary *dados = [listaDados objectAtIndex:indexPath.row];
        //carregando no titulo, o nome do dicionario de dados
        celula.textLabel.text = [dados objectForKey:@"nome"];
    }
    
    return celula;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
