import UIKit
import FirebaseAuth
import FirebaseDatabase
import DesignSystem

class HomeViewController: UIViewController {

    private let summaryLabel = DesignSystem.SALabel(text: "Summary", token: .title)
    private var kmsLabel = DesignSystem.SALabel(text: "Kms: 0.0", token: .heading)
    private var caloriesLabel = DesignSystem.SALabel(text: "Calories: 0", token: .heading)
    private var durationLabel = DesignSystem.SALabel(text: "Duration: 00:00:00", token: .heading)
    private let imageFitness = DesignSystem.SAImageView.fitnessImage
    private var insertDataVC = InsertDataViewController()
    private let stackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        loadData()
        configureStackView()
        addEditDataButton()
    }

    private func configureStackView() {
        view.addSubview(stackView)

        addSummaryStackToStackView()
        setStackViewConstraints()
    }

    private func addSummaryStackToStackView() {
        let summaryStack = UIStackView()
        summaryStack.axis = .vertical
        summaryStack.spacing = 15
        summaryStack.distribution = .fillProportionally

        summaryStack.addArrangedSubview(summaryLabel)
        summaryStack.addArrangedSubview(kmsLabel)
        summaryStack.addArrangedSubview(caloriesLabel)
        summaryStack.addArrangedSubview(durationLabel)

        stackView.addArrangedSubview(summaryStack)
    }

    private func setStackViewConstraints() {
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    private func addEditDataButton() {
        let editDataButton = SAButton(backgroundColor: .systemGreen, title: "Edit Data", action: UIAction(handler: { [weak self] _ in
            self?.editDataButtonTapped()
        }))
        stackView.addArrangedSubview(editDataButton)
    }

    private func editDataButtonTapped() {
        insertDataVC.delegate = self
        navigationController?.pushViewController(insertDataVC, animated: true)
    }

    private func loadData() {
        guard let userEmail = Auth.auth().currentUser?.email else {
            fatalError("User not authenticated.")
        }

        let ref = Database.database().reference().child("users").child(getUsername(from: userEmail))
        ref.observeSingleEvent(of: .value, with: { [weak self] snapshot in
            guard let self = self, let data = snapshot.value as? [String: Any] else {
                return
            }

            if let km = data["km"] as? Double {
                self.kmsLabel.text = "Kms: \(km)"
            }

            if let calories = data["calories"] as? Int {
                self.caloriesLabel.text = "Calories: \(calories)"
            }

            if let duration = data["duration"] as? String {
                self.durationLabel.text = "Duration: \(duration)"
            }
        })
    }

    private func getUsername(from email: String) -> String {
        guard let username = email.split(separator: "@").first else {
            fatalError("Invalid email format.")
        }
        return String(username)
    }

}

// MARK: - InsertDataViewControllerDelegate
extension HomeViewController: InsertDataViewControllerDelegate {
    func inserDataViewController(_ insertDataViewController: InsertDataViewController, didInsertData data: Stadistic) {
        kmsLabel.text = "Kms: \(data.kmString)"
        caloriesLabel.text = "Calories: \(data.calories)"
        durationLabel.text = "Duration: \(data.duration)"
    }
}
