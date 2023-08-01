import UIKit
import Firebase

class HomeViewController: UIViewController {

    private let summaryLabel = SALabel(text: "Summary", token: .title)
    private var kmsLabel = SALabel(text: "Kms: 0.0", token: .heading)
    private var caloriesLabel = SALabel(text: "Calories: 0", token: .heading)
    private var durationLabel = SALabel(text: "Duration: 00:00:00", token: .heading)
    private let imageFitness = SAImageView.fitnessImage
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

}

// MARK: - InsertDataViewControllerDelegate
extension HomeViewController: InsertDataViewControllerDelegate {
    func didInsertData(_ data: Stadistic) {
        kmsLabel.text = "Kms: \(data.kmString)"
        caloriesLabel.text = "Calories: \(data.calories)"
        durationLabel.text = "Duration: \(data.duration)"
    }
}
