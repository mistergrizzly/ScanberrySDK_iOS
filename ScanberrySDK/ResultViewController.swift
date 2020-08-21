//
//  ResultViewController.swift
//  ScanberrySDK
//
//  Created by Mister Grizzly on 8/21/20.
//  Copyright © 2020 Mister Grizzly. All rights reserved.
//

import UIKit

final class ResultViewController: UIViewController {
  
  @IBOutlet private weak var textView: UITextView!
  
  var text: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    
    textView.text = text
  }
}
