//
//  ViewController.swift
//  USBank
//  Created by Baiaman Gapparov on 11/4/21.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/photos")
    let session = URLSession.shared

    var photos = [Photo]()
    
    var contents: [Content] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        
        contents = createArray()
        self.tableView.reloadData()
    }
    
    @IBAction func pressShowImageButton(_ sender: Any) {
        fetchPhotos()
    }
    
    func fetchPhotos() {

        let task = session.dataTask(with:url!, completionHandler: { data, response, error in
            if let error = error {
                print("Error")
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                       (200...299).contains(httpResponse.statusCode) else {
               print("Error with the response, unexpected status code: \(response)")
               return
             }
            
            if let data = data {
            do {
                let decode = try JSONDecoder().decode([Photo].self, from: data)
                
               } catch {
                   print("JSON error: \(error.localizedDescription)")
               }
            }
        })
        task.resume()
    }
    
    func createArray() -> [Content] {
        var contentImages: [Content] = []
        
        let content1 = Content.init(image: UIImage(named: "image1")!, description: "Nature Adicted")
        let content2 = Content.init(image: UIImage(named: "image2")!, description: "Nature Adicted")
        let content3 = Content.init(image: UIImage(named: "image3")!, description: "Nature Adicted")
        let content4 = Content.init(image: UIImage(named: "image4")!, description: "Nature Adicted")
        let content5 = Content.init(image: UIImage(named: "image5")!, description: "Nature Adicted")
        let content6 = Content.init(image: UIImage(named: "image1")!, description: "Nature Adicted")
        let content7 = Content.init(image: UIImage(named: "image2")!, description: "Nature Adicted")
        let content8 = Content.init(image: UIImage(named: "image3")!, description: "Nature Adicted")
        let content9 = Content.init(image: UIImage(named: "image4")!, description: "Nature Adicted")
        let content10 = Content.init(image: UIImage(named: "image5")!, description: "Nature Adicted")
        
        contentImages.append(content1)
        contentImages.append(content2)
        contentImages.append(content3)
        contentImages.append(content4)
        contentImages.append(content5)
        contentImages.append(content6)
        contentImages.append(content7)
        contentImages.append(content8)
        contentImages.append(content9)
        contentImages.append(content10)
        
        return contentImages
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let content = contents[indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "contentCell", for: indexPath) as! ContentTableViewCell
        cell.setContents(content: content)
        return cell
    }
}
