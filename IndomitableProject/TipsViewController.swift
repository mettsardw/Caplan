//
//  TipsViewController.swift
//  IndomitableProject
//
//  Created by Samuel Theodorus Junius on 12/6/17.
//  Copyright © 2017 RagingWind. All rights reserved.
//

import UIKit

class TipsViewController: UIViewController {
    
    @IBOutlet weak var kotakTextIsi: UITextView!
    @IBOutlet weak var labelJudul: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    let koleksiJudul = ["title1","title2","title3","4","5","6"]
    let koleksiIsi = ["ISIINI ADALAH 1","ISI INI ADALAH 2","ISI INI ADALAH 3","4","5","6"]
    
    var indicator:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAnimate()
        
        //self.view.backgroundColor = UIColor(displayP3Red: 119, green: 211, blue: 83, alpha: 0.8)
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        prevButton.isHidden = true
        labelJudul.text = koleksiJudul[0]
        kotakTextIsi.text = koleksiIsi[0]
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonDidTap(_ sender: UIButton) {
        if indicator != koleksiJudul.count-1 {
            indicator += 1
            labelJudul.text = koleksiJudul[indicator]
            kotakTextIsi.text = koleksiIsi[indicator]
            prevButton.isHidden = false
            if indicator == koleksiJudul.count-1{
                nextButton.isHidden = true
            }
        }
    }
    
    @IBAction func prevButtonDidTap(_ sender: UIButton) {
        if indicator != 0 {
            indicator -= 1
            labelJudul.text = koleksiJudul[indicator]
            kotakTextIsi.text = koleksiIsi[indicator]
            nextButton.isHidden = false
            if indicator == 0{
                prevButton.isHidden = true
            }
        }
    }
    
    @IBAction func closeButtonDidTap(_ sender: UIButton) {
        removeAnimate()
    }
    
    
    func showAnimate() {
        self.view.transform = CGAffineTransform(scaleX: 1.3,y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25) {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0,y: 1.0)
        }
    }
    
    func removeAnimate(){
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3,y: 1.3)
            self.view.alpha = 0.0;
        }) { (finished: Bool) in
            if(finished){
                self.view.removeFromSuperview()
            }
        }
    }
    
    
    /*      /// CODINGAN INI NANTI MASUKIN KE BUTTON YANG ADA
         @IBAction func rateButton(sender:UIBarButtonItem) {
         let popOverVC = UIStoryboard(name: "PopUp", bundle: nil).instantiateViewController(withIdentifier: "a") as! PopUpViewController
         self.addChildViewController(popOverVC)
         popOverVC.view.frame = self.view.frame
         self.view.addSubview(popOverVC.view)
         popOverVC.didMove(toParentViewController:  self)
         }
     
     */
    
    
}
