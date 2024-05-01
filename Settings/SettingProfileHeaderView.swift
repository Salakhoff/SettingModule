import UIKit

final class SettingProfileHeaderView: UIView {
    
    // MARK: Outlets
    
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        embedViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure
    
    func configure(with profileImage: UIImage?, name: String, email: String) {
        profileImageView.image = profileImage
        nameLabel.text = name
        emailLabel.text = email
    }
}

// MARK: - EmbedViews

private extension SettingProfileHeaderView {
    func embedViews() {
        [
            profileImageView,
            nameLabel,
            emailLabel,
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.layer.cornerRadius = 40
        profileImageView.layer.masksToBounds = true
        
        nameLabel.font = .systemFont(ofSize: 26, weight: .bold)
        nameLabel.textColor = .white
        
        emailLabel.textColor = .white
    }
}

// MARK: - SetupLayout

private extension SettingProfileHeaderView {
    func setupLayout() {
        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            profileImageView.heightAnchor.constraint(equalToConstant: 80),
            profileImageView.widthAnchor.constraint(equalToConstant: 80),
            
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8),
            
            emailLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            emailLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}

