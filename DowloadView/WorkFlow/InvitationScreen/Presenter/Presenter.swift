//
//  Presenter.swift
//  DowloadView
//
//  Created by Chinar on 26/2/24.
//

import UIKit

//protocol ImageProcessing {
//    func drawText(_ text: String, at position: CGPoint, withFontSize fontSize: CGFloat, in targetSize: CGSize)
//    func generateImageWithText(from invitation: Invitation, targetSize: CGSize, safeAreaTop: CGFloat, safeAreaBottom: CGFloat) -> UIImage?
//    func downloadButtonTapped()
//}
//
//extension ImageProcessing where Self: UIViewController {
//    func drawText(_ text: String, at position: CGPoint, withFontSize fontSize: CGFloat, in targetSize: CGSize) {
//        guard let context = UIGraphicsGetCurrentContext() else { return }
//        
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.alignment = .center
//        
//        let attributes: [NSAttributedString.Key: Any] = [
//            .font: UIFont.systemFont(ofSize: fontSize),
//            .paragraphStyle: paragraphStyle,
//            .foregroundColor: UIColor.white
//        ]
//        
//        let string = NSString(string: text)
//        string.draw(with: CGRect(x: position.x, y: position.y, width: targetSize.width, height: fontSize * 1.2), options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
//    }
//
//    func generateImageWithText(from invitation: Invitation, targetSize: CGSize, safeAreaTop: CGFloat, safeAreaBottom: CGFloat) -> UIImage? {
//        UIGraphicsBeginImageContextWithOptions(targetSize, false, 0)
//        guard let context = UIGraphicsGetCurrentContext() else { return nil }
//        
//     
//        UIColor.white.setFill()
//        context.fill(CGRect(origin: .zero, size: targetSize))
//        
//   
//        let texts: [(text: String, fontSize: CGFloat, position: CGFloat)] = [
//            (invitation.invitedPerson, 32, safeAreaTop),
//            (invitation.invitingFor + invitation.eventName, 26, safeAreaTop + 40),
//            (invitation.eventDate, 20, targetSize.height / 2),
//            (invitation.eventAddress, 20, targetSize.height / 2 + 30),
//            (invitation.eventNote, 18, targetSize.height - safeAreaBottom - 60),
//            (invitation.invitingPerson, 25, targetSize.height - safeAreaBottom - 30)
//        ]
//        
//        texts.forEach { text, fontSize, positionY in
//            drawText(text, at: CGPoint(x: 0, y: positionY), withFontSize: fontSize, in: targetSize)
//        }
//        
//        let finalImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        
//        return finalImage
//    }
//
//    func downloadButtonTapped() {
//        // Assuming you have an array of `Invitation` objects named `invitationData`
//        let screenSize = UIScreen.main.bounds.size
//        let safeAreaTop: CGFloat = 40
//        let safeAreaBottom: CGFloat = 20
//        
//        invitationData.forEach { invitation in
//            guard let imageToSave = generateImageWithText(from: invitation, targetSize: screenSize, safeAreaTop: safeAreaTop, safeAreaBottom: safeAreaBottom) else { return }
//            
//            UIImageWriteToSavedPhotosAlbum(imageToSave, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
//        }
//    }
//
//    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
//        if let error = error {
//            let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "OK", style: .default))
//            present(alertController, animated: true)
//        } else {
//            let alertController = UIAlertController(title: "Saved", message: "The image has been saved to your photos.", preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "OK", style: .default))
//            present(alertController, animated: true)
//        }
//    }
//}
