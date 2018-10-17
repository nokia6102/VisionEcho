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
        
      
        
        //TODO://檢查錄音檔
        //recodeFileisExist
        let thisDay = 1
        let destinationUrl = getDirectoryPath().appendingPathComponent("\(thisDay).m4a")
        let fileExists = FileManager().fileExists(atPath: destinationUrl.path)
        
        if fileExists
        {
            print ("音樂有了")
//            print("file Exists:\(destinationUrl)")
//            // prepare file
//            prepareAudioFile()
        }

        
        configRecordSession()
    }
    
    @IBAction func tapRecode(_ sender: UIButton)
    {
        
        //TODO://檢查錄音檔
        //recodeFileisExist
        let thisDay = 1
        let destinationUrl = getDirectoryPath().appendingPathComponent("\(thisDay).m4a")
        let fileExists = FileManager().fileExists(atPath: destinationUrl.path)
        if fileExists
        {
            //todo:顯示綠色的正在播放
            print("file Exists:\(destinationUrl)")
            print("播放錄音檔")
            
        }
        else
        {
                print ("按下錄音鍵")
                if( enRecode )
                {
                    UIView.animate(withDuration: 1.0, animations: {
                        self.btnRecode.alpha = 1.0
                    }) { (Bool) in
                        self.recoder()
                    }
                }
                else
                {
                    self.stop()
                    UIView.animate(withDuration: 1.0) {
                        self.btnRecode.alpha = 0.3
                    }
                }
                enRecode = !enRecode
        }
       
        
    }

func configRecordSession()
{
        recordingSession = AVAudioSession.sharedInstance()
        
        do {
            //old fail
//            try recordingSession.setCategory(AVAudioSession.Category.playAndRecord)
//            try recordingSession.setActive(true)
            
            //SWift4.2
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
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
 
func prepareAudioFile() {

    let destinationUrl = getDirectoryPath().appendingPathComponent("1.m4a")
  
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: destinationUrl)
        audioPlayer.prepareToPlay()
        print ("\(destinationUrl) 檔案準備完成")
    } catch {
        print("Error:", error.localizedDescription)
    }
}
    
func play()
    {
        audioPlayer.play()
    }
    
func recoder()
    {
//       print("正在錄音...")
      
//            let thisDay = 1
        
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
            } catch {
                print("Record error:", error.localizedDescription)
            }
        
    }
    
func stop()
    {
        print("關掉錄音")
        audioRecorder.stop()
        audioRecorder = nil
        
        let destinationUrl = getDirectoryPath().appendingPathComponent("1.m4a")
        let fileExists = FileManager().fileExists(atPath: destinationUrl.path)
        if fileExists
        {
            //todo:顯示綠色的正在播放
            
//            print ("音樂準備中")
//            print("file Exists:\(destinationUrl)")
//            // prepare file
//            prepareAudioFile()
//
//            print("file Exists:\(destinationUrl)")
//            print("播放錄音檔")
//            play()
            
        
            print(destinationUrl)
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: destinationUrl)
                audioPlayer.volume = 1.0
                audioPlayer.play()
            } catch {
                print("Play error:", error.localizedDescription)
            }
            
//            do{
//                audioPlayer = try AVAudioPlayer(contentsOf: destinationUrl)
//                print ("準備播放")
//                audioPlayer.play()
//                print ("已播放")
//            } catch{
//                print ("error:播放失敗")
//            }
            
        }
        
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
