//
//  InvitationCollectionViewCell.swift
//  DowloadView
//
//  Created by Chinar on 15/2/24.
//

import UIKit

class InvitationCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "InvitationCollectionViewCellReuseIdentifier"
    
     lazy var invitationImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.contentMode = .scaleToFill
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        return view
    }()
    
     lazy var invitedPersonLabel: UILabel = {
         let view = UILabel()
         view.translatesAutoresizingMaskIntoConstraints = false
         view.textColor = .black
         view.font = UIFont.systemFont(ofSize: 12, weight: .medium)
         view.textAlignment = .center
         return view
     }()
    
    private lazy var invitingForLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var eventNameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var eventDateLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 8, weight: .regular)
        view.textAlignment = .center
        return view
    }()

    private lazy var eventAddressLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 8, weight: .regular)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var eventNoteLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 8, weight: .regular)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var invitingPersonLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        view.textAlignment = .center
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        backgroundColor = .black
        contentView.addSubview(invitationImage)
        contentView.addSubview(invitedPersonLabel)
        contentView.addSubview(invitingForLabel)
        contentView.addSubview(eventNameLabel)
        contentView.addSubview(eventDateLabel)
        contentView.addSubview(eventAddressLabel)
        contentView.addSubview(eventNoteLabel)
        contentView.addSubview(invitingPersonLabel)
        self.contentView.layer.cornerRadius = 12
        self.contentView.layer.masksToBounds = true
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            invitationImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            invitationImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            invitationImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            invitationImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            invitedPersonLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            invitedPersonLabel.bottomAnchor.constraint(equalTo: invitingForLabel.topAnchor, constant: -20),

            invitingForLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            invitingForLabel.bottomAnchor.constraint(equalTo: eventNameLabel.topAnchor, constant: -10),

            eventNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            eventNameLabel.bottomAnchor.constraint(equalTo: eventDateLabel.topAnchor, constant: -12),

            eventDateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            eventDateLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            eventAddressLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            eventAddressLabel.topAnchor.constraint(equalTo: eventDateLabel.bottomAnchor, constant: 5),
            
            eventNoteLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            eventNoteLabel.topAnchor.constraint(equalTo: eventAddressLabel.bottomAnchor, constant: 20),
            
            invitingPersonLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            invitingPersonLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func setupData(data: Invitation) {
        invitationImage.image = UIImage(named: data.image)
        invitedPersonLabel.text = data.invitedPerson
        invitingForLabel.text = data.invitingFor
        eventNameLabel.text = data.eventName
        eventDateLabel.text = data.eventDate
        eventAddressLabel.text = data.eventAddress
        eventNoteLabel.text = data.eventNote
        invitingPersonLabel.text = data.invitingPerson
    }
}
