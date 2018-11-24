//
//  ViewController.swift
//  Toy2
//
//  Created by Moriz Schildorfer on 11/10/18.
//  Copyright © 2018 Moriz Schildorfer. All rights reserved.
//

import UIKit

extension UIViewController{
    func dismissKeyBoardWhenTappingAround(){
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard(){
        view.endEditing(false)
    }
    
}

class ViewController: UIViewController {
    var submitted : Bool = false
    @IBOutlet weak var SubmitButton: UIButton!
    @IBOutlet weak var FavoriteTextField: UITextField!
    @IBOutlet weak var PotatosonaLabel: UILabel!
    
    @IBOutlet weak var PotatosonaTextField: UITextField!
    
    @IBOutlet weak var DisplayLabel: UILabel!
    @IBOutlet weak var FavoriteLabel: UILabel!
    
    @IBAction func SubmitButtonTapped(_ sender: Any) {
        submitted = !submitted
        if(submitted){
            
            let potato = PotatosonaTextField.text ?? ""
            let favorite = FavoriteTextField.text ?? ""
            
            UserDefaults.standard.set(potato, forKey: "potato")
            UserDefaults.standard.set(favorite, forKey:"favorite")
            PotatosonaTextField.text=""
            FavoriteTextField.text=""
            
            enterClearedMode()
        }
        else{
            
            enterSubmitMode()
            UserDefaults.standard.removeObject(forKey:  "potato")
            UserDefaults.standard.removeObject(forKey: "favorite")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dismissKeyBoardWhenTappingAround()
        
        if(UserDefaults.standard.object(forKey: "potato") != nil){
            enterClearedMode()
            submitted=true
            
        }
        else{
            enterSubmitMode()
        }
        if(Potato.count == 0){
            Potato.loadPotatos{ (result) in
                for dict in result {
                    let imageURL = URL(string: dict["image"]!)
                    let image = UIImage(data: try! Data(contentsOf: imageURL!))
                    
                    Potato.addPotato(type: dict["type"], image: image, likes: dict["likes"], hates: dict["hates"], interested: "Russet")
                }
            }
            Potato.addPotato(type: "Russet", image: #imageLiteral(resourceName: "russet") ,likes: "Sitting in the Oven", hates: "Sport", interested: "Self")
            Potato.addPotato(type: "Sweet", image: #imageLiteral(resourceName: "sweet") ,likes: "Russet ;)", hates: "Russet ;)", interested: "Russet")
            Potato.addPotato(type: "Ruby", image: #imageLiteral(resourceName: "ruby") ,likes: "Long walks on the beach", hates: "The beach", interested: "Sweet")
        }
    }
    func enterSubmitMode() -> Void {
        PotatosonaLabel.isHidden=false
        FavoriteLabel.isHidden=false
        PotatosonaTextField.isHidden=false
        FavoriteTextField.isHidden=false
        DisplayLabel.isHidden=true
        
        SubmitButton.setTitle("Submit", for: .normal)
    }
    
    func enterClearedMode() -> Void {
        let potato = UserDefaults.standard.string(forKey: "potato")
        let favorite = UserDefaults.standard.string(forKey: "favorite")
        
        DisplayLabel.text = "The "+potato!+" is enjoying some "+favorite!+" in a not so glorius act of cannibalism!"
        PotatosonaLabel.isHidden=true
        FavoriteLabel.isHidden=true
        PotatosonaTextField.isHidden=true
        FavoriteTextField.isHidden=true
        DisplayLabel.isHidden=false
        SubmitButton.setTitle("Clear", for: .normal)
    }

}

