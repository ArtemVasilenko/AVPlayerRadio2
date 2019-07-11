import UIKit
import AVFoundation
//import AVKit

class ViewController: UIViewController {
    
    
    let rabbitPath = "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRabbitInNora()
    }
    
    
    func getRabbitInNora() {
        guard let rabbitUrl = URL(string: rabbitPath) else {print("error URL"); return}
        let player = AVPlayer(url: rabbitUrl)
        print("player = \(player.description)")
        let layer = AVPlayerLayer(player: player)
        
        layer.frame = self.view.bounds
        self.view.layer.addSublayer(layer)
        player.play()
        
    }
    
}

