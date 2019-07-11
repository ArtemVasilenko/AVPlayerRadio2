import UIKit
//import AVFoundation
import AVKit

class ViewController: UIViewController {
    
    
    let rabbitPath = "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
    
    let myButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 30, y: 30, width: 40, height: 40)
        button.setTitle("GO!", for: .normal)
        button.titleLabel?.textColor = .red
        button.backgroundColor = .green
        
        button.addTarget(self, action: #selector(getController), for: .touchDown)
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(myButton)
//        getRabbitInNora()
        getController()
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
    
    @objc func getController() {
        guard let urlWatch = URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8") else { return }
        
        let player = AVPlayer(url: urlWatch)
        
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = self.view.bounds
//        self.view.layer.addSublayer(playerLayer)
        
        let controller = AVPlayerViewController()
        controller.player = player
        
        present(controller, animated: true) {
            player.play()
        }
        
    }
    
}

