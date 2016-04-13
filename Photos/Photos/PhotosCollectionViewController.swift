//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    var photos: [Photo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let api = InstagramAPI()
        api.loadPhotos(didLoadPhotos)
        // FILL ME IN
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let eachPhotoCell = collectionView.dequeueReusableCellWithReuseIdentifier("eachPhotoCell", forIndexPath: indexPath) as! PhotosViewCell
        if (photos != nil) {
            let currentPhoto: Photo! = photos[indexPath.section + indexPath.item]
            loadImageForCell(currentPhoto, imageView: eachPhotoCell.photoView)
            eachPhotoCell.backgroundColor = UIColor.clearColor()
        }
        return eachPhotoCell
    }

    /* 
     * IMPLEMENT ANY COLLECTION VIEW DELEGATE METHODS YOU FIND NECESSARY
     * Examples include cellForItemAtIndexPath, numberOfSections, etc.
     */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "viewFullImageSegue") {
            let viewController = segue.destinationViewController as! SinglePhotoViewController
            if (photos != nil) {
                let eachPhotoCell = sender as! UICollectionViewCell
                
                let indexPath = self.collectionView!.indexPathForCell(eachPhotoCell)
                let photo : Photo! = photos[indexPath!.section + indexPath!.item]
                let url = NSURL(string: photo.url)
                let data = NSData(contentsOfURL: url!)
                //                viewController.start(photo.username, numberOfLikes: String(photo.likes), photo: UIImage(data: data!)!, datePosted: photo.createdtime)
            }
        }
    }
    
    /* Creates a session from a photo's url to download data to instantiate a UIImage. 
       It then sets this as the imageView's image. */
    func loadImageForCell(photo: Photo, imageView: UIImageView) {
        let url = NSURL(string: photo.url)
        let data = NSData(contentsOfURL: url!)
        imageView.image = UIImage(data: data!)
    }
    
    /* Completion handler for API call. DO NOT CHANGE */
    func didLoadPhotos(photos: [Photo]) {
        self.photos = photos
        self.collectionView!.reloadData()
    }
    
}

