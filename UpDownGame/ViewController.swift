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
    @IBOutlet weak var sliderValueLable : UILabel!
    
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
        sliderValueLable.text = "15" //
        slider.minimumValue = 0 //
        slider.maximumValue = 30 //
        slider.value = 15 //
        
        tryCount = 0 //
        tryCountLable.text = "0 / 5" //
        
        
        
        
    }
    
    @IBAction func sliderValueChanged(_ sender : UISlider){
        print(sender.value)
        let IntegerValue : Int = Int(sender.value)
        sliderValueLable.text = String(IntegerValue)
    }
    
    @IBAction func touchUpHitButton(_ sender : UIButton){
        print(slider.value)
        let hitValue : Int = Int(slider.value)
        slider.value = Float(hitValue)
        
        tryCount = tryCount + 1
        tryCountLable.text = "\(tryCount) / 5" //문자열 보간법
        //tryCountLable.text = String(tryCount) + " / 5"
        
        if randomValue == hitValue{
            showAlert(message : "You Win!")
            reset()
            return
        }else if tryCount >= 5 {
            showAlert(message : "You Lose!")
            reset()
            return
        }else if slider.value > Float(hitValue){
            minimumValueLable.text = String(hitValue)
            slider.minimumValue = Float(hitValue)
        }else if slider.value > Float(hitValue){
            maximumValueLable.text = String(hitValue)
            slider.maximumValue = Float(hitValue)
        }
    }
    
    func showAlert(message : String){
        let alert = UIAlertController(title: nil,
                                      message: message ,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { (action) in self.reset()
        }
        alert.addAction(okAction)
        present(alert,
                animated: true,
                completion: nil)
    }
    
    @IBAction func touchUpResetButton(_ sender : UIButton){
        print("touch up reset button")
        reset()
    }
}

