//
//  ViewController.swift
//  Alian imageView Time 03
//
//  Created by D7703_22 on 2019. 3. 28..
//  Copyright © 2019년 fb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var alienImageView: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    var count = 1
    var myTimer = Timer()  //타이머 객체 생성
    var isAnimating = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        alienImageView.image = UIImage(named: "Image\(count)")
        countLabel.text = String(count)
    }

    
    @IBAction func playBtn(_ sender: Any) {
        print("playBtn")
        
        //Timer 작동
        if isAnimating == true {return}
        else{ isAnimating = true}
        
        myTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(doAnimation), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseBtn(_ sender: Any) {
        print("pauseBtn")
        myTimer.invalidate()
        isAnimating = false
    }
    
    @IBAction func stopBtn(_ sender: Any) {
        print("stopBtn")
        myTimer.invalidate()
        count = 0
        alienImageView.image = UIImage(named: "Image\(count)")
        countLabel.text = String(count)
        isAnimating = false
    }
    
    @objc func doAnimation() {
        
        if count == 5 {count = 0}
        
        count+=1
        alienImageView.image = UIImage(named: "Image\(count)")
        countLabel.text = String(count)
    }
    
    
}
