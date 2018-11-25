//
//  AddPotatoCell.swift
//  Toy2
//
//  Created by Moriz Schildorfer on 11/23/18.
//  Copyright © 2018 Moriz Schildorfer. All rights reserved.
//

import UIKit

var interested: String! = "Nobody"
var likes: String! = ""
var hates: String! = ""
var type: String! = ""
var selectedRow : Int! = 0

class AddPotatoCell: UITableViewCell , UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate{

    var addPotatoViewControllerShortcut : AddPotatoViewController? = nil
    
    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var PickerView: UIPickerView!
    override func awakeFromNib() {
        super.awakeFromNib()
        PickerView.delegate = self
        PickerView.dataSource = self
        TextView.delegate = self
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //Mark: PickerView Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Potato.count+1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(row==0){
            return "Self"
        }
        else{
            return Potato.potatoArr[row-1].type
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = row
        if(row==0){
            interested = "Self"
        }
        else{
            interested = Potato.potatoArr[row-1].type
        }
        //reload
        addPotatoViewControllerShortcut?.TableView.reloadRows(at: [IndexPath.init(row: 0, section: 2)], with: .automatic)
        
        addPotatoViewControllerShortcut?.DoneButton.isEnabled=canSubmit()
        
        
        print(selectedRow)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if(textView.textColor==UIColor.green){
            likes = textView.text
        }
        else if(textView.textColor==UIColor.red){
            hates = textView.text
        }
        else{
            type = textView.text
        }
        
        addPotatoViewControllerShortcut?.DoneButton.isEnabled=canSubmit()
    }
    
    //Mark: TextView Methods
    func textViewDidBeginEditing(_ textView: UITextView) {
        if(textView.textColor == UIColor.gray){
            textView.textColor = UIColor.black
        }
        if(textView.tag == 0){
            textView.text = ""
            textView.tag = 1
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if(textView.text == ""){
            if(textView.textColor==UIColor.black){
                textView.textColor = UIColor.gray
                textView.text = "Type"
            }
            else if(textView.textColor==UIColor.green){
                textView.text = "Likes"
            }
            else if(textView.textColor==UIColor.red){
                textView.text = "Hates"
            }
            textView.tag = 0
        }
        
    }
    
    func canSubmit() -> Bool{
        return interested != "Nobody" && type != "" && hates != "" && likes != ""
    }
}
