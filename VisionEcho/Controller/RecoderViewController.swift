//
//  RecoderViewController.swift
//  VisionEcho
//
//  Created by Leon Cheng on 2018/10/16.
//  Copyright © 2018年 Leon Cheng. All rights reserved.
//

import UIKit
import AVFoundation

class RecoderViewController: UIViewController {
    var enRecode = true
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer!
    var lastestDay: Int = 0
    
    @IBOutlet weak var btnRecode: UIButton!
    var timer :Timer?
    
    override func viewDidAppear(_ animated: Bool)
    {
        self.setTabBarHidden(true, animated: animated, duration: 1.5)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if let number: Int = UserDefaults.standard.object(forKey: "lastestDay") as? Int {
            lastestDay = number
        }

        //檢查錄音檔
        let thisDay = 1
        let destinationUrl = getDirectoryPath().appendingPathComponent("\(thisDay).m4a")
        let fileExists = FileManager().fileExists(atPath: destinationUrl.path)
        
        if fileExists
        {
            print ("音樂有了")
        }
        // Configure record session
        configRecordSession()
        
      
    }
    @IBAction func tapPlay(_ sender:UIButton)
    {
        let recordFilePath = getDirectoryPath().appendingPathComponent("1.m4a")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: recordFilePath)
            audioPlayer.volume = 1.0
            audioPlayer.play()
        } catch {
            print("Play error:", error.localizedDescription)
        }
    }
    
    @IBAction func tapRecode(_ sender: UIButton)
    {
                print ("按下錄音鍵")
                if( enRecode )
                {
                    self.recoder()
                    UIView.animate(withDuration: 1.0, animations: {
                        self.btnRecode.alpha = 1.0
                    }) { (Bool) in
                        print ("按下錄音鍵的動畫完成")
                    }
                }
                else
                {
                    self.stop()
                    UIView.animate(withDuration: 1.0, animations: {
                        self.btnRecode.alpha = 0.3
                    }) { (Bool) in
                        self.play()
                    }
                    
                }
                enRecode = !enRecode
    }

func configRecordSession()
{

        recordingSession = AVAudioSession.sharedInstance()
    
        do {
            //SWift4.2 iOS12 only
          try AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default, options: [])
          try AVAudioSession.sharedInstance().setActive(true)
   
            recordingSession.requestRecordPermission() { permissionAllowed in
                if permissionAllowed {

                } else {
                    // failed to record!
                }
            }
        } catch {
            print("Session error:", error.localizedDescription)
        }
}
    
func getDirectoryPath() -> URL
{
        // create document folder url
        let fileDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return fileDirectoryURL
}
    
func play()
    {
        let destinationUrl = getDirectoryPath().appendingPathComponent("1.m4a")
        let fileExists = FileManager().fileExists(atPath: destinationUrl.path)
        if fileExists
        {
            print("Check Audio file")
            print(destinationUrl)
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: destinationUrl)
                audioPlayer.volume = 1.0
                audioPlayer.play()
            } catch {
                print("Play error:", error.localizedDescription)
            }
        }
    }

    @objc func animationRecoder()
    {
//        UIView.animate(withDuration: 1.0, animations: {
//            self.btnRecode.alpha = 0.5
//        }) { (Bool) in
//            self.btnRecode.alpha = 1.0
//        }
        UIView.animate(withDuration: 1.0, animations: {
            self.btnRecode.alpha = 0.5
        }) {(Bool) in
                    UIView.animate(withDuration: 1.0, animations: {
                        self.btnRecode.alpha = 1.0
                    }) { (Bool) in
                        self.btnRecode.alpha = 0.5
                    }
            }
        
    }
    
func recoder()
    {
            let destinationUrl = getDirectoryPath().appendingPathComponent("1.m4a")
            
            let settings = [AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                            AVSampleRateKey: 44100,
                            AVNumberOfChannelsKey: 2,
                            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]
            
            do {
                audioRecorder = try AVAudioRecorder(url: destinationUrl, settings: settings)
                audioRecorder.record()
                  print("正在錄音...")
                
                timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(animationRecoder), userInfo: nil, repeats: true)
                
               
                
            } catch {
                print("Record error:", error.localizedDescription)
            }
        
    }
    
func stop()
    {
        if self.timer != nil {
            self.timer?.invalidate()
            print("Close Timer")
        }
        
        print("關掉錄音")
        
        audioRecorder.stop()
        audioRecorder = nil
    }
    
    override func viewWillDisappear(_ animated: Bool) {
         self.setTabBarHidden(false, animated: animated, duration: 0.5)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
