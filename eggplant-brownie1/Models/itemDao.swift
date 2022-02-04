//
//  itemDao.swift
//  eggplant-brownie1
//
//  Created by Natanael Alves Pereira on 01/02/22.
//

import Foundation

class ItemDao {
    
    func save (_ itens: [Item]){
        
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false)
            
            guard let caminho = recuperaDiretorio() else{ return }
            try dados.write(to: caminho)
            
        } catch{
            print(error.localizedDescription)
        }
        
    }
    
    func recupera() -> [Item] {
    
    do {
        guard let diretorio = recuperaDiretorio() else {return []}
        let dados = try Data(contentsOf: diretorio)
        
        let itensSalvos = try
        
        NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as! [Item]
        
        return = itensSalvos
    }catch {
        print(error.localizedDescription)
        return[]
    }
    
    
    func recuperaDiretorio() -> URL? {
        
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}

        let caminho = diretorio.appendingPathComponent("itens")
        
        return caminho
    }
        
  }

}
