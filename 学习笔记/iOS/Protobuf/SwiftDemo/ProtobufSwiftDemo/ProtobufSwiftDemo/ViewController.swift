//
//  ViewController.swift
//  ProtobufSwiftDemo
//
//  Created by Link on 2019/2/26.
//  Copyright © 2019 Link. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var ageTextfield: UITextField!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        testMp3PBSize()
    }
    
    @IBAction func clickButton(_ sender: Any) {
        
        let person = Person.with { (person) in
            if let nameStr = nameTextfield.text {
                person.name = nameStr
            }
            if let age = Int32(ageTextfield.text ?? "") {
                person.age = age
            }
        }
        
        //序列化
        let binaryData = try! person.serializedData()
        
        //反序列化
        let decodePerson = try! Person(serializedData: binaryData)
        
        contentLabel.text = "姓名:\(decodePerson.name), 年龄:\(decodePerson.age)"
        
        // pbObj -> jsonData
        let jsonData = try! person.jsonUTF8Data()
        
        //pbobj -> jsonStr
        let jsonStr = try! person.jsonString()
        
    }
    
    func testMp3PBSize() {
        let mp3Path = Bundle.main.path(forResource: "澤野弘之 - Desert.mp3", ofType: nil)
        let mp3Url = URL(fileURLWithPath: mp3Path!)
        let mp3Data = try! Data(contentsOf: mp3Url)
        
        print("mp3大小:\(mp3Data.count)")
        //mp3大小:6758128
        
        let mp3Message = Mp3Message.with { (mp3Message) in
            mp3Message.mp3Data = mp3Data
        }
        let mp3PBData = try! mp3Message.serializedData()
        print("mp3转PB后的大小:\(mp3PBData.count)")
        //mp3转PB后的大小:6758133
        
    }
    
}

