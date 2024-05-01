import UIKit

final class SettingViewController: UIViewController {
    
    // MARK: SettingData
    
    let settings = SettingService.shared
    
    // MARK: Outlets
    
    private let settingTableView = UITableView()
    private let settingProfileHeaderView = SettingProfileHeaderView()
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        embedViews()
        setupBehaviour()
        registerCell()
        setupLayout()
    }
}

// MARK: - SetupBehaviour

private extension SettingViewController {
    func setupBehaviour() {
        settingTableView.dataSource = self
        settingTableView.delegate = self
    }
}

// MARK: - EmbedViews

private extension SettingViewController {
    func embedViews() {
        settingTableView.translatesAutoresizingMaskIntoConstraints = false
        settingTableView.backgroundView = UIImageView(
            image: UIImage(named: "background")
        )
        settingTableView.separatorStyle = .none
        settingTableView.estimatedRowHeight = 50
        
        settingProfileHeaderView.configure(
            with: UIImage(named: "profile"),
            name: "Jose Phonie",
            email: "JosePhonie123@gmail.com"
        )
        
        view.addSubview(settingTableView)
        
        setup(header: settingProfileHeaderView)
        
        updateHeaderLayout()
    }
}

// MARK: - RegisterCell

private extension SettingViewController {
    func registerCell() {
        settingTableView.register(
            SettingTableViewCell.self,
            forCellReuseIdentifier: SettingTableViewCell.cellID
        )
    }
}

// MARK: - SetupLayout

private extension SettingViewController {
    func setupLayout() {
        NSLayoutConstraint.activate([
            settingTableView.topAnchor.constraint(equalTo: view.topAnchor),
            settingTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            settingTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension SettingViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        settings.section.count
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            settings.section[section].cells.count
        }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingTableViewCell.cellID,
                for: indexPath
            ) as? SettingTableViewCell else {
                return UITableViewCell()
            }
            
            let section = settings.section[indexPath.section]
            let model = section.cells[indexPath.row]
            
            cell.configure(with: model)
            cell.backgroundColor = .clear
            
            return cell
        }
}

// MARK: - UITableViewDelegate

extension SettingViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        let headerView = UIView(
            frame: CGRect(
                x: 0, y: 0,
                width: tableView.bounds.width, height: 37
            )
        )
        
        headerView.backgroundColor = .clear
        
        let titleLabel = PaddedLabel(
            frame: CGRect(
                x: 20,
                y: 0,
                width: tableView.bounds.width - 40,
                height: 37
            )
        )
        
        titleLabel.backgroundColor = .white
        titleLabel.text = settings.section[section].title
        
        headerView.addSubview(titleLabel)
        
        return headerView
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        37
    }
}

// MARK: - SetupHeader

private extension SettingViewController {
    func setup(header: UIView) {
        header.translatesAutoresizingMaskIntoConstraints = false
        
        settingTableView.tableHeaderView = header
        
        NSLayoutConstraint.activate([
            header.widthAnchor.constraint(equalTo: settingTableView.widthAnchor)
        ])
    }
}

// MARK: - UpdateHeaderLayout
private extension SettingViewController {
    func updateHeaderLayout() {
        guard settingTableView.tableHeaderView != nil else { return }
        
        settingTableView.tableHeaderView?.setNeedsLayout()
        settingTableView.tableHeaderView?.layoutIfNeeded()
    }
}

#Preview("TableView", traits: .defaultLayout, body: {
    SettingViewController()
})

