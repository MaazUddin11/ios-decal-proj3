//
//  SinglePhotoViewController.swift
//  Photos
//
//  Created by Maaz Uddin on 4/13/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import UIKit
import Foundation

class SinglePhotoViewController: UIViewController {

    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var numberOfLikesLabel: UILabel!
    @IBOutlet var datePostedLabel: UILabel!
    @IBOutlet var heartButton: UIButton!
    @IBOutlet var photoView: UIImageView!
    
    var userName: String!
    var numberOfLikes: String!
    var datePosted: Int!
    var photo: UIImage!
    var isTheHeartIconActive = 0
    
    func start(userName: String, numberOfLikes:String, photo: UIImage, datePosted:String) {
        self.userName = userName
        self.numberOfLikes = numberOfLikes
        self.photo = photo
        self.datePosted = Int(datePosted)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = userName
        photoView.image = photo
        let postedTimeInterval = NSTimeInterval(datePosted)
        let date = NSDate(timeIntervalSince1970:postedTimeInterval)
        let dateFormatter = NSDateFormatter()
        let theDateFormat = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateStyle = theDateFormat
        datePostedLabel.text = dateFormatter.stringFromDate(date)
        numberOfLikesLabel.text = numberOfLikes
    }
    
    
}
