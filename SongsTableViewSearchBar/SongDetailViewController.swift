//
//  SongDetailViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Keshawn Swanston on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class SongDetailViewController: UIViewController {
    var song: Song?
    
    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songImage.image = #imageLiteral(resourceName: "loveSongs")
        guard let song = song else {
            return
        }
        songNameLabel.text = song.name
        artistLabel.text = song.artist
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
