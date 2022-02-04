//
//  Alerta.swift
//  eggplant-brownie1
//
//  Created by Natanael Alves Pereira on 28/01/22.
//

import UIKit

class Alerta {
    
    let controller: UIViewController
    
    init(controller: UIViewController){
        self.controller = controller
    }
    
    func exibe (titulo: String = "Atençào", mensagem: String ){
        
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert )
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alerta.addAction(ok)
        controller.present(alerta, animated: true, completion: nil)
    }
}
