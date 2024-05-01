import UIKit

final class SettingTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let arrowImageView = UIImageView()
    private let toggleSwitch = UISwitch()
    
    // MARK: CellID
    
    static let cellID = "SettingTableViewCell"
    
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        embedViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: LifeCycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        titleLabel.text = nil
        arrowImageView.isHidden = false
        toggleSwitch.isHidden = true
    }
    
    // MARK: Configure
    
    func configure(with model: SettingModel) {
        iconImageView.image = UIImage(named: model.icon.rawValue)
        titleLabel.text = model.title
        arrowImageView.isHidden = model.isToggleShowed
        toggleSwitch.isHidden = !model.isToggleShowed
    }
}

// MARK: - EmbedViews

private extension SettingTableViewCell {
    func embedViews() {
        [
            iconImageView,
            titleLabel,
            arrowImageView,
            toggleSwitch
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        contentView.backgroundColor = .clear
        
        toggleSwitch.isHidden = true
        
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .white
        
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        titleLabel.textColor = .black
        
        arrowImageView.image = UIImage(named: "arrow")
        arrowImageView.contentMode = .scaleAspectFit
        arrowImageView.tintColor = .white
        arrowImageView.isHidden = true
    }
}

// MARK: - SetupLayout

private extension SettingTableViewCell {
    func setupLayout() {
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            arrowImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            arrowImageView.widthAnchor.constraint(equalToConstant: 24),
            arrowImageView.heightAnchor.constraint(equalToConstant: 24),
            
            toggleSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            toggleSwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
