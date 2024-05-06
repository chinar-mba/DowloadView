//
//  DetailViewController.swift
//  DowloadView
//
//  Created by Chinar on 15/2/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var invitation: Invitation? {
        didSet {
            updateUI()
        }
    }
    
    private lazy var invitationImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.contentMode = .scaleToFill
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var downloadButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Сохранить", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.layer.cornerRadius = 20
        view.backgroundColor = .systemPink
        view.addTarget(self, action: #selector(downloadButtonTapped), for: .touchUpInside)
        return view
    }()
    
    private lazy var shareButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Поделиться", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.layer.cornerRadius = 20
        view.backgroundColor = .gray
        view.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        return view
    }()
    
    private lazy var invitedPersonLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var invitingForLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 9, weight: .medium)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var eventNameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var eventDateLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var eventAddressLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var eventNoteLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var invitingPersonLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 19, weight: .medium)
        view.textAlignment = .center
        return view
    }()
    
    private let invitationData: [Invitation] = [
        .init(image: "Frame 400", invitedPerson: "Дорогие коллеги", invitingFor: "Приглашаю на ", eventName: "День Рождения", eventDate: "19 июня, 20:00", eventAddress: "По адресу: Асанбай, Suzie Wong Bar", eventNote: "Примечание: дресс-код черный", invitingPerson: "Мирбек"),
        .init(image: "Frame 400", invitedPerson: "Дорогие коллеги", invitingFor: "Приглашаю на ", eventName: "День Рождения", eventDate: "19 июня, 20:00", eventAddress: "По адресу: Асанбай, Suzie Wong Bar", eventNote: "Примечание: дресс-код черный", invitingPerson: "Мирбек"),
        .init(image: "Frame 400", invitedPerson: "Дорогие коллеги", invitingFor: "Приглашаю на ", eventName: "День Рождения", eventDate: "19 июня, 20:00", eventAddress: "По адресу: Асанбай, Suzie Wong Bar", eventNote: "Примечание: дресс-код черный", invitingPerson: "Мирбек"),
        .init(image: "Frame 400", invitedPerson: "Дорогие коллеги", invitingFor: "Приглашаю на ", eventName: "День Рождения", eventDate: "19 июня, 20:00", eventAddress: "По адресу: Асанбай, Suzie Wong Bar", eventNote: "Примечание: дресс-код черный", invitingPerson: "Мирбек"),
        .init(image: "Frame 400", invitedPerson: "Дорогие коллеги", invitingFor: "Приглашаю на ", eventName: "День Рождения", eventDate: "19 июня, 20:00", eventAddress: "По адресу: Асанбай, Suzie Wong Bar", eventNote: "Примечание: дресс-код черный", invitingPerson: "Мирбек"),
        .init(image: "Frame 400", invitedPerson: "Дорогие коллеги", invitingFor: "Приглашаю на ", eventName: "День Рождения", eventDate: "19 июня, 20:00", eventAddress: "По адресу: Асанбай, Suzie Wong Bar", eventNote: "Примечание: дресс-код черный", invitingPerson: "Мирбек")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    private func setup() {
        setupViews()
        setupConstraints()
        setupNavigationBar()
        
    }
    
    private func setupViews() {
        view.addSubview(invitationImage)
        view.addSubview(invitedPersonLabel)
        view.addSubview(invitingForLabel)
        view.addSubview(eventNameLabel)
        view.addSubview(eventDateLabel)
        view.addSubview(eventAddressLabel)
        view.addSubview(eventNoteLabel)
        view.addSubview(invitingPersonLabel)
        view.addSubview(downloadButton)
        view.addSubview(shareButton)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([

            invitationImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            invitationImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            invitationImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            invitationImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),

            invitedPersonLabel.topAnchor.constraint(equalTo: invitationImage.topAnchor, constant: 30),
            invitedPersonLabel.centerXAnchor.constraint(equalTo: invitationImage.centerXAnchor),

            invitingForLabel.centerXAnchor.constraint(equalTo: invitationImage.centerXAnchor),
            invitingForLabel.centerYAnchor.constraint(equalTo: eventNameLabel.topAnchor, constant: -60),

            eventNameLabel.centerXAnchor.constraint(equalTo: invitationImage.centerXAnchor),
            eventNameLabel.centerYAnchor.constraint(equalTo: eventDateLabel.topAnchor, constant: -60),

            eventDateLabel.centerXAnchor.constraint(equalTo: invitationImage.centerXAnchor),
            eventDateLabel.centerYAnchor.constraint(equalTo: invitationImage.centerYAnchor),
            
            eventAddressLabel.centerXAnchor.constraint(equalTo: invitationImage.centerXAnchor),
            eventAddressLabel.centerYAnchor.constraint(equalTo: eventDateLabel.bottomAnchor, constant: 60),
            
            eventNoteLabel.centerXAnchor.constraint(equalTo: invitationImage.centerXAnchor),
            eventNoteLabel.centerYAnchor.constraint(equalTo: eventAddressLabel.bottomAnchor, constant: 60),
            
            invitingPersonLabel.centerXAnchor.constraint(equalTo: invitationImage.centerXAnchor),
            invitingPersonLabel.bottomAnchor.constraint(equalTo: invitationImage.bottomAnchor, constant: -30),
            
            downloadButton.topAnchor.constraint(equalTo: invitationImage.bottomAnchor, constant: 20),
            downloadButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            downloadButton.heightAnchor.constraint(equalToConstant: 40),
            downloadButton.widthAnchor.constraint(equalToConstant: 120),
            
            shareButton.topAnchor.constraint(equalTo: invitationImage.bottomAnchor, constant: 20),
            shareButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            shareButton.heightAnchor.constraint(equalToConstant: 40),
            shareButton.widthAnchor.constraint(equalToConstant: 120),
        ])
    }
    
    private func updateUI() {
        guard let invitation = invitation else { return }
        invitationImage.image = UIImage(named: invitation.image)
        invitedPersonLabel.text = "\(invitation.invitedPerson)"
        invitingForLabel.text = "\(invitation.invitingFor)"
        eventNameLabel.text = "\(invitation.eventName)"
        eventDateLabel.text = "\(invitation.eventDate)"
        eventAddressLabel.text = "\(invitation.eventAddress)"
        eventNoteLabel.text = "\(invitation.eventNote)"
        invitingPersonLabel.text = "\(invitation.invitingPerson)"
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Предварительный просмотр"
        let fontSize: CGFloat = 18
        let fontColor = UIColor.systemPink
        let font = UIFont.systemFont(ofSize: fontSize, weight: .semibold)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: fontColor, NSAttributedString.Key.font: font]
    }
    
    func drawText(_ text: String, at position: CGPoint, withFontSize fontSize: CGFloat, in targetSize: CGSize) {
        let font = UIFont.systemFont(ofSize: fontSize)
        let textSize = NSString(string: text).size(withAttributes: [.font: font])
        let textX = (targetSize.width - textSize.width) / 2
        let textY = position.y
        
        let textRect = CGRect(x: textX, y: textY, width: textSize.width, height: textSize.height)
        NSString(string: text).draw(in: textRect, withAttributes: [.font: font, .foregroundColor: UIColor.black])
    }
    
    // Function to generate an image with text
    func generateImageWithText(from invitation: Invitation, targetSize: CGSize, safeAreaTop: CGFloat, safeAreaBottom: CGFloat) -> UIImage? {
        guard let originalImage = UIImage(named: invitation.image) else { return nil }
        
        UIGraphicsBeginImageContextWithOptions(targetSize, false, UIScreen.main.scale)
        originalImage.draw(in: CGRect(origin: .zero, size: targetSize))
        
        // Text configurations
        let texts = [
            (text: invitation.invitedPerson, fontSize: 32, position: "top"),
            (text: invitation.invitingFor, fontSize: 26, position: "middleTop"),
            (text: invitation.eventName, fontSize: 35, position: "middleTop"),
            (text: invitation.eventDate, fontSize: 20, position: "center"),
            (text: invitation.eventAddress, fontSize: 20, position: "middleBottom"),
            (text: invitation.eventNote, fontSize: 18, position: "middleBottom"),
            (text: invitation.invitingPerson, fontSize: 25, position: "bottom")
        ]
        
        let topY = safeAreaTop
        let bottomY = targetSize.height - safeAreaBottom
        var middleTopY = topY
        var middleBottomY = bottomY
        
        let spacing = (bottomY - topY) / CGFloat(texts.filter { $0.position != "top" && $0.position != "bottom" }.count + 1)
        
        texts.forEach { element in
            switch element.position {
            case "top":
                drawText(element.text, at: CGPoint(x: 0, y: topY), withFontSize: CGFloat(element.fontSize), in: targetSize)
            case "middleTop":
                middleTopY += spacing
                drawText(element.text, at: CGPoint(x: 0, y: middleTopY), withFontSize: CGFloat(element.fontSize), in: targetSize)
            case "center":
                drawText(element.text, at: CGPoint(x: 0, y: (targetSize.height - CGFloat(element.fontSize)) / 2), withFontSize: CGFloat(element.fontSize), in: targetSize)
            case "middleBottom":
                middleBottomY -= spacing
                drawText(element.text, at: CGPoint(x: 0, y: middleBottomY), withFontSize: CGFloat(element.fontSize), in: targetSize)
            case "bottom":
                drawText(element.text, at: CGPoint(x: 0, y: bottomY - CGFloat(element.fontSize)), withFontSize: CGFloat(element.fontSize), in: targetSize)
            default: break
            }
        }
        
        let finalImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return finalImage
    }
    
    @objc private func downloadButtonTapped() {
        let screenSize = UIScreen.main.bounds.size
        let scale = UIScreen.main.scale
        let safeAreaTop: CGFloat = 40
        let safeAreaBottom: CGFloat = 20

        guard  let invitation = invitation, let imageToSave = generateImageWithText(from: invitation, targetSize: screenSize, safeAreaTop: safeAreaTop, safeAreaBottom: safeAreaBottom) else {
            print("Error generating or retrieving image")
            return
        }
            UIImageWriteToSavedPhotosAlbum(imageToSave, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            print(error.localizedDescription)
        } else {
            print("Success")
        }
    }
    
    @objc private func shareButtonTapped () {
        guard let image = invitationImage.image else {
            print("Image not found")
            return
        }
        
        let itemsToShare: [Any] = [image]
        
        let activityViewController = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)
        
        activityViewController.excludedActivityTypes = [.airDrop, .addToReadingList]
        
        if let popoverController = activityViewController.popoverPresentationController {
            popoverController.sourceView = shareButton
            popoverController.sourceRect = shareButton.bounds
            popoverController.permittedArrowDirections = .any
        }
        
        present(activityViewController, animated: true)
    }
}
