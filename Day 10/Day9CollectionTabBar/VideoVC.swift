//
//  VideoVC.swift
//  day 9
//
//  Created by Jigisha Patel on 2018-03-02.
//  Copyright © 2018 JK. All rights reserved.
//

import UIKit
import AVKit

class VideoVC: UIViewController {

    var video = AVPlayer()
    var videoPlayer = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnPlayAction(_ sender: UIButton) {
        if let path = Bundle.main.path(forResource: "Toronto", ofType: "mp4"){
            
            self.video = AVPlayer(url: URL(fileURLWithPath: path))
            self.videoPlayer = AVPlayerViewController()
            self.videoPlayer.player = video
            
            self.present(self.videoPlayer, animated: true, completion: {
                self.video.play()
            })
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
