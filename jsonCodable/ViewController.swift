//
//  ViewController.swift
//  jsonCodable
//
//  Created by Ivan Karpets on 1/27/19.
//  Copyright © 2019 Ivan Karpets. All rights reserved.
//

import UIKit

struct WebSiteDescription: Decodable {
    let name: String
    let description: String
    let courses: [Course]
}
struct Course: Decodable{
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let urlString = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
        
            guard let dataString = data else { return }
            
            do{
              let courses = try JSONDecoder().decode([Course].self, from: dataString)
                print(courses)
                
            }catch let serializationErr{
                print(serializationErr)
            }
            
        }.resume()
    }


}

