//
//  ViewController.swift
//  RotatingTimer
//
//  Created by Joel A. Kulesza on 5/18/17.
//  Copyright © 2017 Joel A. Kulesza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var viewBG: UIView!
  
  @IBOutlet weak var txtTalkHH: UITextField!
  @IBOutlet weak var txtTalkMM: UITextField!
  @IBOutlet weak var txtWrapHH: UITextField!
  @IBOutlet weak var txtWrapMM: UITextField!
  @IBOutlet weak var txtTalkSS: UITextField!
  @IBOutlet weak var txtWrapSS: UITextField!
  
  @IBOutlet weak var btnReset: UIButton!
  @IBOutlet weak var btnStartPause: UIButton!
  
  @IBOutlet weak var lblClock: UILabel!
  
  var timeClock = 0
  var timeTalk = 0
  var timeWrap = 0
  
  var timer = Timer()
  
  let colorGo = #colorLiteral(red: 0.6089196801, green: 0.9142148495, blue: 0.5659961104, alpha: 1)
  let colorGoButton = #colorLiteral(red: 0.5318313241, green: 0.8016784191, blue: 0.493891716, alpha: 1)
  let colorStop = #colorLiteral(red: 1, green: 0.4723592401, blue: 0.4896897674, alpha: 1)
  let colorStopButton = #colorLiteral(red: 0.8655853868, green: 0.3263420463, blue: 0.3433278799, alpha: 1)
  let colorGoFaster = #colorLiteral(red: 0.9472041726, green: 0.9058479667, blue: 0.4927703738, alpha: 1)
  let colorGoFasterButton = #colorLiteral(red: 1, green: 0.8445501924, blue: 0, alpha: 1)
  
  var timeSet = false
    
  func didTapView(){
    self.view.endEditing(true)
  }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    updateColors()
    // pbTotalProgress.transform = CGAffineTransform(scaleX: 1, y: 10)
    
    // Allow tapping outside of the text boxes to close the number pad.
    let tapRecognizer = UITapGestureRecognizer()
    tapRecognizer.addTarget(self, action: #selector(ViewController.didTapView))
    self.view.addGestureRecognizer(tapRecognizer)
    
    /*
    // Scale time label to fill
    lblClock.numberOfLines = 1;
    lblClock.minimumScaleFactor = 1.0;
    lblClock.adjustsFontSizeToFitWidth = true;
     */
  }
  
  func setTimeBoxes() {
    if(txtTalkHH.text == "") { txtTalkHH.text = "0" }
    if(txtTalkMM.text == "") { txtTalkMM.text = "0" }
    if(txtTalkSS.text == "") { txtTalkSS.text = "0" }
    if(txtWrapHH.text == "") { txtWrapHH.text = "0" }
    if(txtWrapMM.text == "") { txtWrapMM.text = "0" }
    if(txtWrapSS.text == "") { txtWrapSS.text = "0" }
    
    if(Int(txtTalkHH.text!)! > 99) { txtTalkHH.text = "99" }
    if(Int(txtTalkMM.text!)! > 59) { txtTalkMM.text = "59" }
    if(Int(txtTalkSS.text!)! > 59) { txtTalkSS.text = "59" }
    if(Int(txtWrapHH.text!)! > 99) { txtWrapHH.text = "99" }
    if(Int(txtWrapMM.text!)! > 59) { txtWrapMM.text = "59" }
    if(Int(txtWrapSS.text!)! > 59) { txtWrapSS.text = "59" }
    
    if(Int(txtTalkHH.text!)! < 0) { txtTalkHH.text = "0" }
    if(Int(txtTalkMM.text!)! < 0) { txtTalkMM.text = "0" }
    if(Int(txtTalkSS.text!)! < 0) { txtTalkSS.text = "0" }
    if(Int(txtWrapHH.text!)! < 0) { txtWrapHH.text = "0" }
    if(Int(txtWrapMM.text!)! < 0) { txtWrapMM.text = "0" }
    if(Int(txtWrapSS.text!)! < 0) { txtWrapSS.text = "0" }
    
    return
  }
  
  func calcLabelFromTimeClock() {
    let timeClockValue = abs(timeClock)
    let timeClockHours = Int(floor(Float(timeClockValue) / 3600.0))
    let timeClockMinutes = Int(floor((Float(timeClockValue) - Float(timeClockHours) * 3600.0) / 60.0))
    let timeClockSeconds = Int(Float(timeClockValue) - Float(timeClockHours) * 3600.0 - Float(timeClockMinutes) * 60.0)
    lblClock.text = String(format: "%02d:", timeClockHours)
                  + String(format: "%02d:", timeClockMinutes)
                  + String(format: "%02d", timeClockSeconds)
    return
  }
  
  func calcBoxesFromTimes() {
    var timeClockValue = abs(timeTalk)
    var timeClockHours = Int(floor(Float(timeClockValue) / 3600.0))
    var timeClockMinutes = Int(floor((Float(timeClockValue) - Float(timeClockHours) * 3600.0) / 60.0))
    var timeClockSeconds = Int(Float(timeClockValue) - Float(timeClockHours) * 3600.0 - Float(timeClockMinutes) * 60.0)
    txtTalkHH.text = String(timeClockHours)
    txtTalkMM.text = String(timeClockMinutes)
    txtTalkSS.text = String(timeClockSeconds)

    timeClockValue = abs(timeWrap)
    timeClockHours = Int(floor(Float(timeClockValue) / 3600.0))
    timeClockMinutes = Int(floor((Float(timeClockValue) - Float(timeClockHours) * 3600.0) / 60.0))
    timeClockSeconds = Int(Float(timeClockValue) - Float(timeClockHours) * 3600.0 - Float(timeClockMinutes) * 60.0)
    txtWrapHH.text = String(timeClockHours)
    txtWrapMM.text = String(timeClockMinutes)
    txtWrapSS.text = String(timeClockSeconds)
    
    setTimeBoxes()
    
    return
  }
  
  func calcTimeClock() {
    setTimeBoxes()
    timeTalk = Int(txtTalkHH.text!)! * 3600 + Int(txtTalkMM.text!)! * 60 + Int(txtTalkSS.text!)!
    timeWrap = Int(txtWrapHH.text!)! * 3600 + Int(txtWrapMM.text!)! * 60 + Int(txtWrapSS.text!)!
    if(timeWrap >= timeTalk) {
      timeWrap = Int(0.2 * Float(timeTalk))
    }
    calcBoxesFromTimes()
    timeClock = timeTalk
    calcLabelFromTimeClock()
    return
  }
  
  func resetTimerBehavior() {
    timeSet = false
    calcTimeClock()
    updateColors()
    return
  }

  func updateColors() {
    if(timeClock > timeWrap || !timeSet) {
      viewBG.backgroundColor = colorGo
      btnReset.backgroundColor = colorGoButton
      btnStartPause.backgroundColor = colorGoButton
    } else if (timeClock > 0 && timeClock <= timeWrap) {
      viewBG.backgroundColor = colorGoFaster
      btnReset.backgroundColor = colorGoFasterButton
      btnStartPause.backgroundColor = colorGoFasterButton
    } else {
      viewBG.backgroundColor = colorStop
      btnReset.backgroundColor = colorStopButton
      btnStartPause.backgroundColor = colorStopButton
    }
    return
  }

  /*
  func resetProgressBar() {
    pbTotalProgress.progress = 0.0
    pbTotalProgress.progressTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    return
  }
  
  func updateProgressBar() {
    if(timeClock > 0) {
      pbTotalProgress.progress = 1.0 - Float(timeClock) / Float(timeTalk)
    } else {
      pbTotalProgress.progress = 1.0
      pbTotalProgress.progressTintColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
    }
    return
  }
 */
  
  func runTimer() {
    timeClock -= 1
    calcLabelFromTimeClock()
    updateColors()
    // supdateProgressBar()
  }
  
  @IBAction func btnStartPause(_ sender: UIButton) {
    if(!timer.isValid) {
      if(!timeSet) {
        calcTimeClock()
        timeSet = true
      }
      timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.runTimer), userInfo: nil, repeats: true)
      btnStartPause.setTitle("Pause", for: .normal)
    } else {
      timer.invalidate()
      btnStartPause.setTitle("Start", for: .normal)
    }
  }
  
  @IBAction func btnReset(_ sender: UIButton) {
    timer.invalidate()
    resetTimerBehavior()
    btnStartPause.setTitle("Start", for: .normal)
    // resetProgressBar()
  }
 
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

