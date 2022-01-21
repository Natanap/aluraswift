//
//  ViewController.swift
//  eggplant-brownie1
//
//  Created by Natanael Alves Pereira on 20/01/22.
//

import UIKit

class ViewController: UIViewController {
    
        @IBOutlet var nomeTextField: UITextField!
    
        @IBOutlet var felicidadeTextField: UITextField!

        @IBAction   func adicionar() {
             
             let nome = nomeTextField.text
             let felicidade = felicidadeTextField.text
             
             print("comi \(nome) e fiquei com felicidade: \(felicidade)")
         }
    }


