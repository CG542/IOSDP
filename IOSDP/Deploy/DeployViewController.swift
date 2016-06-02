//
//  DeployViewController.swift
//  IOSDP
//
//  Created by Andy on 5/27/16.
//  Copyright (c) 2016 Mot. All rights reserved.
//

import UIKit

class DeployViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {

    @IBOutlet weak var picker: UIPickerView!
    
    var allDPs: Array<String> = Array<String>()
    var allSettings: Array<String> = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDP()
        loadSetting()
        // Do any additional setup after loading the view.
    }

    func loadDP(){
        allDPs = HttpUtility.GetAllDPNames()
        if allDPs.count>0{
            selectedDP = allDPs[0]
        }
    }
    
    func loadSetting(){
        allSettings = HttpUtility.GetAllSettings()
        if allSettings.count>0 {
            selectedProfile = allSettings[0]
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == 0){
            return allDPs.count
        }
        else{
            return allSettings.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if component == 0{
            return allDPs[row]
        }
        else{
            return allSettings[row]
        }
    }
    
    var selectedDP:String?=nil
    var selectedProfile:String?=nil
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0){
            self.selectedDP = allDPs[row]
        }
        else{
            self.selectedProfile=allSettings[row]
        }
    }
    
    @IBAction func deploy_Click() {
        if(selectedDP != nil && selectedProfile != nil){
            HttpUtility.SetDPConfig(selectedDP!, profileName: selectedProfile!)
        }
    }


}
