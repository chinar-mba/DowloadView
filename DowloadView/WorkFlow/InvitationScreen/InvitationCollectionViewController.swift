//
//  InvitationViewController.swift
//  DowloadView
//
//  Created by Chinar on 15/2/24.
//

import UIKit
import Photos

class InvitationViewController: UIViewController {
    
    var images: [UIImage?] = Array(repeating: nil, count: 6)
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 170, height: 226)
        layout.minimumLineSpacing = 26
        
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(InvitationCollectionViewCell.self, forCellWithReuseIdentifier: InvitationCollectionViewCell.reuseIdentifier)
        view.backgroundColor = .black
        view.dataSource = self
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var downloadButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Сохранить все", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.layer.cornerRadius = 20
        view.backgroundColor = .systemPink
        view.addTarget(self, action: #selector(downloadButtonTapped), for: .touchUpInside)
        return view
    }()
    
    private let invitationData: [Invitation] = [
        .init(image: "Frame 400", invitedPerson: "Дорогие коллеги", invitingFor: "Приглашаю на ", eventName: "День Рождения", eventDate: "19 июня, 20:00", eventAddress: "По адресу: Асанбай, Suzie Wong Bar", eventNote: "Примечание: дресс-код черный", invitingPerson: "Мирбек"),
        .init(image: "Frame 400", invitedPerson: "Дорогие cxv", invitingFor: "Приглашаю на ", eventName: "День Рождения", eventDate: "19 июня, 20:00", eventAddress: "По адресу: Асанбай, Suzie Wong Bar", eventNote: "Примечание: дресс-код черный", invitingPerson: "Мирбек"),
        .init(image: "Frame 400", invitedPerson: "Дорогие cb", invitingFor: "Приглашаю на ", eventName: "День Рождения", eventDate: "19 июня, 20:00", eventAddress: "По адресу: Асанбай, Suzie Wong Bar", eventNote: "Примечание: дресс-код черный", invitingPerson: "Мирбек"),
        .init(image: "Frame 400", invitedPerson: "Дорогие cc", invitingFor: "Приглашаю на ", eventName: "День Рождения", eventDate: "19 июня, 20:00", eventAddress: "По адресу: Асанбай, Suzie Wong Bar", eventNote: "Примечание: дресс-код черный", invitingPerson: "Мирбек"),
        .init(image: "Frame 400", invitedPerson: "Дорогие vv", invitingFor: "Приглашаю на ", eventName: "День Рождения", eventDate: "19 июня, 20:00", eventAddress: "По адресу: Асанбай, Suzie Wong Bar", eventNote: "Примечание: дресс-код черный", invitingPerson: "Мирбек"),
        .init(image: "Frame 400", invitedPerson: "Дорогие vvv", invitingFor: "Приглашаю на ", eventName: "День Рождения", eventDate: "19 июня, 20:00", eventAddress: "По адресу: Асанбай, Suzie Wong Bar", eventNote: "Примечание: дресс-код черный", invitingPerson: "Мирбек")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        images = [
            UIImage(named: "Frame 400"),
            UIImage(named: "Frame 400"),
            UIImage(named: "Frame 400"),
            UIImage(named: "Frame 400"),
            UIImage(named: "Frame 400"),
            UIImage(named: "Frame 400")
        ]
        setupViews()
        setupNavigationBar()
        setupConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .black
        view.addSubview(collectionView)
        view.addSubview(downloadButton)
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Предварительный просмотр"
        
        let backButtonItem = UIBarButtonItem(title: "<", style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButtonItem
        
        let fontSize: CGFloat = 18
        let fontColor = UIColor.systemPink
        let font = UIFont.systemFont(ofSize: fontSize, weight: .semibold)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: fontColor, NSAttributedString.Key.font: font]
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            downloadButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.heightAnchor.constraint(equalToConstant: 40),
            downloadButton.widthAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    // Function to draw text at a given position
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
    
    @objc private func downloadButtonTapped(for index: Int) {
        let screenSize = UIScreen.main.bounds.size
        let scale = UIScreen.main.scale
        let safeAreaTop: CGFloat = 40
        let safeAreaBottom: CGFloat = 20
        
        for invitation in invitationData {
            guard let imageToSave = generateImageWithText(from: invitation, targetSize: screenSize, safeAreaTop: safeAreaTop, safeAreaBottom: safeAreaBottom) else { continue }
            
            UIImageWriteToSavedPhotosAlbum(imageToSave, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        }
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            print(error.localizedDescription)
        } else {
            print("Success")
        }
    }
}

extension InvitationViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InvitationCollectionViewCell.reuseIdentifier, for: indexPath) as? InvitationCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .black
        let model = invitationData[indexPath.item]
        cell.setupData(data: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let invitation = invitationData[indexPath.item]
        showDetailScreenFor(invitation: invitation)
       
    }
    
    private func showDetailScreenFor(invitation: Invitation) {
        let detailVC = DetailViewController()
        detailVC.invitation = invitation
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
}
