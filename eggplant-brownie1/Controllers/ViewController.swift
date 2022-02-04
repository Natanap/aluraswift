//
//  ViewController.swift
//  eggplant-brownie1
//
//  Created by Natanael Alves Pereira on 20/01/22.
//

import UIKit

protocol AdicionaRefeicaoDelegate   {
    func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource , UITableViewDelegate , AdicionaItensDelegate {
    
    
        // MARK: -IBOutlet
    
      
       @IBOutlet weak var itensTableView: UITableView!
    
    
        // MARK: - Atributos
    
        var delegate: AdicionaRefeicaoDelegate?
        var itens: [Item] = []
        
        var itensSelecionados: [Item] = []
     
    
        // MARK: - IBOutlet
        @IBOutlet var nomeTextField: UITextField?
        @IBOutlet weak var felicidadeTextField: UITextField?
    
        // MARK: View life cycle
    
          override func viewDidLoad() {
              let botaoAdicionarItem = UIBarButtonItem (title: "adicionar", style: .plain, target: self, action: #selector(adicionarItens))
              navigationItem.rightBarButtonItem = botaoAdicionarItem
              
      }
    
           func recuperaItens(){
             itens = ItemDao().recupera()
    }
    
          @objc func adicionarItens(){
              let adicionarItensViewController = AdicionarItensViewController(delegate: self)
              navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
           func add(_ item: Item) {
               itens.append(item)
               ItemDao().save(itens)
               
               if let tableView = itensTableView{
                   tableView.reloadData()
               }else{
                   Alerta(controller: self).exibe(mensagem: "Erro ao atualizar a tabela")
               }
               
              
    }
    
           
    
        // MARK: - UITableViewDataSource
    
           func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return itens.count
      }
        
    
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
               let linhaDaTabela = indexPath.row
               let item = itens[linhaDaTabela]
                
                celula.textLabel?.text = item.nome
                
                return celula
                
       }
    
        // MARK: - UITableViewDelegate
    
             func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                 guard  let celula = tableView.cellForRow(at: indexPath) else {return}
                 
                 if celula.accessoryType == .none {
                     celula.accessoryType = .checkmark
                     let linhaDaTabela = indexPath.row
                     itensSelecionados.append(itens[linhaDaTabela])
                 }else {
                     celula.accessoryType = .none
                     
                     let item = itens[indexPath.row]
                     if let position = itensSelecionados.firstIndex(of: item) {
                         itensSelecionados.remove(at: position)
                         
                 }
                 
            }
       }
    
            func recuperaRefeicaoDoFormulario() -> Refeicao?{
               
                guard let nomeDaRefeicao = nomeTextField?.text else {
                    return nil
                }
                
                guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
                    return nil
                    
                }
            
                let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
                
                return refeicao
    }
    
        // MARK: - Action

            @IBAction func adicionar (){
            
                if let refeicao = recuperaRefeicaoDoFormulario() {
            
                 delegate?.add(refeicao)
                 navigationController?.popViewController(animated: true)
            } else{
                Alerta(controller: self).exibe(mensagem: "Erro ao iniciar o formulario")
            }
    }
}



