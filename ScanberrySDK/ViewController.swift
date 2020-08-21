//
//  ViewController.swift
//  ScanberrySDK
//
//  Created by Mister Grizzly on 8/21/20.
//  Copyright © 2020 Mister Grizzly. All rights reserved.
//

import UIKit
import QuickLook

final class ViewController: UIViewController {

  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var infoLabel: UILabel!
  @IBOutlet private weak var spinner: UIActivityIndicatorView! {
    didSet{
      spinner.hidesWhenStopped = true
    }
  }
  
  fileprivate var image: UIImage?
  
//  fileprivate var manager: SBSDKRecognitionManager?
  fileprivate let tempURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("recognized-pdf.pdf")
//  private let configuration = SBSDKUIConfiguration(with: .white, navigationBarBarTintColor: .lightGray)
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    manager = SBSDKRecognitionManager(language: .english, dataSource: Bundle.main, engineMode: .tesseractOnly)
    
    if let image = imageView.image {
      self.image = image
    }
    
    self.navigationItem.title = "ScanberrySDK Demo"
    
    if imageView.image == nil {
      infoLabel.isHidden = false
      infoLabel.text = "Please take a picture using camera or import one and start recognition."
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    spinner.scale(factor: 2.0)
  }
  
  @IBAction private func startCamera() {
//    let controller = ScanberrySDK.default.getCameraController(with: configuration, delegate: self, image: nil)
//    present(controller, animated: true, completion: nil)
  }
  
  @IBAction private func editTapped() {
    guard let image = image else { return }
//    let controller = ScanberrySDK.default.getCameraController(with: configuration, delegate: self, image: image)
//    present(controller, animated: true, completion: nil)
  }
  
  @IBAction private func galleryTapped() {
    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
       let imagePickerController = UIImagePickerController()
       imagePickerController.delegate = self
       imagePickerController.sourceType = .photoLibrary
       imagePickerController.allowsEditing = false
       
       present(imagePickerController, animated: true, completion: nil)
     }
  }
  
  @IBAction private func ocrTapped() {
    guard let image = image else { return }
    spinner.startAnimating()
    
//    DispatchQueue.global(qos: .background).async {
//      let result = self.manager?.performOCR(on: image)
//      DispatchQueue.main.async {
//        switch result {
//        case .success(let text):
//          self.spinner.stopAnimating()
//          debugPrint(text)
//
//          guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else { return }
//          controller.text = text
//          self.navigationController?.pushViewController(controller, animated: true)
//        default:
//          debugPrint(111)
//        }
//      }
//    }
  }
  
  @IBAction private func pdfOcrTapped() {
    guard let image = image else { return }
//    spinner.startAnimating()
//    DispatchQueue.global(qos: .background).async {
//      let pdfData = try? self.manager?.createPDF(from: [image])
//      try? pdfData?.write(to: self.tempURL)
//      
//      DispatchQueue.main.async {
//        self.spinner.stopAnimating()
//        
//        if FileManager.default.fileExists(atPath: self.tempURL.path) {
//          let previewController = QLPreviewController()
//          previewController.dataSource = self
//          self.navigationController?.pushViewController(previewController, animated: true)
//        }
//      }
//    }
  }
}

//extension ViewController: SBSDKCameraNavigationScannerControllerDelegate {
//  func cameracontroller(_ scanner: UINavigationController, didFinishScanningWithResults results: SBSDKImageScannerResults) {
//
//    scanner.dismiss(animated: true) {
//      self.infoLabel.isHidden = true
//      if results.doesUserPreferEnhancedScan {
//        self.imageView.image = results.enhancedScan?.image
//        self.image = results.enhancedScan?.image
//      } else {
//        self.imageView.image = results.croppedScan.image
//        self.image = results.croppedScan.image
//      }
//    }
//  }
//
//  func cameraControllerDidCancel(_ scanner: UINavigationController) {
//    scanner.dismiss(animated: true, completion: nil)
//  }
//
//  func cameraController(_ scanner: UINavigationController, didFailWithError error: Error) {
//    debugPrint(error.localizedDescription)
//    self.infoLabel.isHidden = false
//  }
//}

//MARK:- QLPreviewController Datasource
extension ViewController: QLPreviewControllerDataSource {
  func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
    return 1
  }
  
  func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
    return self.tempURL as QLPreviewItem
  }
}

extension UIActivityIndicatorView {
  func scale(factor: CGFloat) {
    guard factor > 0.0 else { return }
    transform = CGAffineTransform(scaleX: factor, y: factor)
  }
}

extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    picker.dismiss(animated: true) {
      if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        self.imageView.image = image
        self.image = image
        self.infoLabel.isHidden = true
      }
    }
  }
}
