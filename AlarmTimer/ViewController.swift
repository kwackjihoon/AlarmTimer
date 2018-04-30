//
//  ViewController.swift
//  AlarmTimer
//
//  Created by L703 on 2018. 4. 30..
//  Copyright © 2018년 L703. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblCurrent: UILabel!
    @IBOutlet weak var lblAlarmTime: UILabel!
    @IBOutlet weak var myDataPicker: UIDatePicker!
    
    var myTimer = Timer()
    
    func updateTime() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        
        lblCurrent.text = formatter.string(from: date)
        
        if lblCurrent.text == lblAlarmTime.text{
            view.backgroundColor = UIColor.red
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        
        lblAlarmTime.text = formatter.string(from: myDataPicker.date)
        
        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (myTimer) in
            self.updateTime()
        })
    }
        
    @IBAction func DataPicker(_ sender: Any) {
        
        print("change Date Picker")
        print(myDataPicker.date)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        lblAlarmTime.text = formatter.string(from: myDataPicker.date)
        
    }
    
    @IBAction func btReset(_ sender: Any) {
        view.backgroundColor = UIColor.white
    }
    

}

