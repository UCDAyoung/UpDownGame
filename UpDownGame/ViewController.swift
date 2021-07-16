//
//  ViewController.swift
//  UpDownGame
//
//  Created by 박준영 on 2021/07/16.
//

import UIKit

class ViewController: UIViewController {

    var randomValue : Int = 0
    var tryCount : Int = 0
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var tryCountLable : UILabel!
    @IBOutlet weak var sliederValueLable : UILabel!
    
    @IBOutlet weak var minimumValueLable : UILabel!
    @IBOutlet weak var maximumValueLable : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
    }
    @IBAction func reset(){
        print("reset!")
        randomValue = Int.random(in: 0...30) //
        print(randomValue)//
        minimumValueLable.text = "0" //
        maximumValueLable.text = "30" //
        sliederValueLable.text = "15" //
        slider.minimumValue = 0 //
        slider.maximumValue = 30 //
        slider.value = 15 //
        
        tryCount = 0 //
        tryCountLable.text = "0 / 5" //
        
        
        
        
    }
    
    @IBAction func sliderValueChanged(_ sender : UISlider){
        print(sender.value)
    }
    
    @IBAction func touchUpHitButton(_ sender : UIButton){
        print(slider.value)
    
    }
    
    @IBAction func touchUpResetButton(_ sender : UIButton){
        print("touch up reset button")
        reset()
    }
}

