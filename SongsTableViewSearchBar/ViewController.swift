//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
  
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var songArr = [Song]()
    var searchTerm: String? {
        didSet {
            self.tableView.reloadData()
        }
    }
    var filteredSongArr: [Song] {
        guard let searchTerm = searchTerm, searchTerm != "" else {
            return songArr
        }
            return songArr.filter{$0.name.lowercased().contains(searchTerm.lowercased())}
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        songArr = Song.loveSongs
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSongArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let song = filteredSongArr[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Song Cell", for: indexPath)
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.artist
        cell.imageView?.image = UIImage(named: "loveSongs")
        return cell
    }

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using// Get the new view controller using segue.destination
        if let destination = segue.destination as?
            SongDetailViewController {
            let selectedRow = tableView.indexPathForSelectedRow!.row
            let selectedSong = self.songArr[selectedRow]
            destination.song = selectedSong
        // Pass the selected object to the new view controller.
        }
    }
    
    //    MARK: - Space Bar Delegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        tableView.reloadData()
        searchBar.endEditing(true)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchTerm = searchText
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }

}

