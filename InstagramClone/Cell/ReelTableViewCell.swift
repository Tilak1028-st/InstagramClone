//
//  ReelTableViewCell.swift
//  InstagramClone
//
//  Created by PCS213 on 16/06/22.
//

import UIKit
import AVFoundation

class ReelTableViewCell: UITableViewCell {
    
    @IBOutlet weak var reelVideoView: UIView!
    //  @IBOutlet weak var reelImageView: UIImageView!
    @IBOutlet weak var marqueeLabel: UILabel!
    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var likeImageWidthConstraint: NSLayoutConstraint!
    
    lazy var likeAnimator = LikeAnimator(container: contentView, layoutConstraint: likeImageWidthConstraint)
    
    lazy var doubleTapRecognizer: UITapGestureRecognizer = {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didDoubletap))
        tapRecognizer.numberOfTapsRequired = 2
        return tapRecognizer
    }()
    
    
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    var isVideoPlaying = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let url = URL(string: "https://content.jwplatform.com/manifests/vM7nH0Kl.m3u8")!
        player = AVPlayer(url: url)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resize
        reelVideoView.layer.addSublayer(playerLayer)
        playerLayer.frame = reelVideoView.bounds
        playPressed()
        
        self.reelVideoView.isUserInteractionEnabled = true
        self.reelVideoView.addGestureRecognizer(doubleTapRecognizer)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = reelVideoView.bounds
    }
    
    @objc func didDoubletap() {
        likeAnimator.animate {
            self.likeImageView.image = UIImage(systemName: "heart.fill")
        }
    }
    
    //    @objc
    func playPressed() {
        if isVideoPlaying
        {
            player.pause()
        }
        else
        {
            player.play()
        }
        isVideoPlaying = !isVideoPlaying
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
