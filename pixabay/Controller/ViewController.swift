//
//  ViewController.swift
//  pixabay
//
//  Created by Amr Ali on 7/16/18.
//  Copyright © 2018 TheAmrAli. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController , UISearchBarDelegate {
    
    var ImagesURL = [String]()
    var searchMode = false
    typealias DownloadComplete = () -> ()
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == ""
        {
            searchMode = false
        }else{
            searchMode = true
        let KeyWords = SearchBar.text!
        let FormattedKeyWords = KeyWords.replacingOccurrences(of: " ", with: "+")
        
        let BaseURl: String = "https://pixabay.com/api/?key=9567121-8184b54de2911c7bded1545f2&q=\(FormattedKeyWords)&image_type=photo&pretty=true"
            DownloadImagesUrl(BaseURL: BaseURl , completed: {
                
            })
    }
}
    
    
    
    func DownloadImagesUrl (BaseURL:String ,completed : @escaping DownloadComplete) {
            let API_Call_Link = URL(string: BaseURL )
            
            Alamofire.request(API_Call_Link!, method: .get).responseJSON { response  in
                let result = response.result
               // print(response)
                
              //  let json = JSON(data: result)

               if let dict = result.value as? Dictionary<String , AnyObject> {
                    
                  /*  if let Hits = dict["hits"] as? Array {
                       // self.ImagesURL.append(ImgUrl)
                        print(self.ImagesURL)
                    }*/
                
                if let hits = dict["hits"] as? [Dictionary<String , AnyObject>] {
                   // print(hits)
                    for count in hits{
                    
                    if let ImgURL = count["largeImageURL"] as?  String   {
                       // print(ImgURL)
                        self.ImagesURL.append(ImgURL)
                        print(self.ImagesURL)
                    }
                }
            }
                }
                
            }
        completed()
        }
  
    
   
    
    let ImagesArray = [UIImage]()
    
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var SearchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TableView.delegate = self
        TableView.dataSource = self
        SearchBar.delegate = self
        
        print("Anything")
        
    }


}

extension ViewController : UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ImagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = TableView.dequeueReusableCell(withIdentifier: "ImagesCell") as? ImagesCell
            else {
            return UITableViewCell()
        }
        return cell
    }
    
}



