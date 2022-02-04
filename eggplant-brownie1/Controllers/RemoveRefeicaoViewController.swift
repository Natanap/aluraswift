//
//  RemoveRefeicaoViewController.swift
//  eggplant-brownie1
//
//  Created by Natanael Alves Pereira on 31/01/22.
//

import UIKit

class RemoveRefeicaoViewController {
    
    let controller: UIViewController
    
    init(controller: UIViewController){
        self.controller = controller
    }
    
    
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction)-> Void) {
    
    let alerta = UIAlertController(title: refeicao.nome, message:refeicao.detalhes(), preferredStyle: .alert)
    
    let botaoCancelar = UIAlertAction(title: "cancelar", style: .cancel)
    
    alerta.addAction(botaoCancelar)
    
    let botaoRemover = UIAlertAction(title: "remover", style:.destructive, handler: handler)
    
    alerta.addAction(botaoRemover)
    
        controller.present(alerta, animated: true , completion: nil)
   }

}
