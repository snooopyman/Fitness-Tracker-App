import UIKit

class HomeViewController: UIViewController {

    private let stackView = UIStackView()
    private let summaryLabel = SALabel(texto: "Summary", font: .boldSystemFont(ofSize: 40))
    private var kmsLabel = SALabel(texto: "Kms: 0.0", font: .systemFont(ofSize: 20))
    private var caloriesLabel = SALabel(texto: "Calories: 0", font: .systemFont(ofSize: 20))
    private var durationLabel = SALabel(texto: "Duration: 00:00:00", font: .systemFont(ofSize: 20))
    private let imageFitness = SAImageView(imageNamed: "fitness.png")
    private var insertData = InsertDataViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        insertData.delegate = self

        configureStackView()
        addEditDataButton()
    }

    private func configureStackView() {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 20

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
        stackView.translatesAutoresizingMaskIntoConstraints = false
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
        let insertDataVC = InsertDataViewController()
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


/*import UIKit

 class HomeViewController: UIViewController {

 let stackView = UIStackView()
 private var kmsLabel: UILabel!
 private var caloriesLabel: UILabel!
 private var durationLabel: UILabel!
 let imageFitness = SAImageView(imageNamed: "fitness.png")
 let inserDataViewController = InsertDataViewController()
 inserDataViewController.delegate = self

 override func viewDidLoad() {
 super.viewDidLoad()
 view.backgroundColor = .white
 configureStackView()
 }

 func configureStackView() {
 view.addSubview(stackView)
 stackView.axis = .vertical
 stackView.spacing = 20

 addSummaryStackToStackView() // Stack para resumen diario y gráfica
 //addGoalsStackToStackView() // Stack horizontal para metas

 setStackViewConstraints()
 }

 func addSummaryStackToStackView() {
 let summaryStack = UIStackView()
 summaryStack.axis = .vertical
 summaryStack.spacing = 15
 summaryStack.distribution = .fillProportionally

 let summaryLabel = UILabel()
 summaryLabel.text = "Summary"
 //summaryLabel.font = .boldSystemFont(ofSize: 40)
 summaryLabel.font = UIFont(name: "AvenirNext-DemiBoldItalic", size: 48)
 summaryStack.addArrangedSubview(summaryLabel)

 kmsLabel = UILabel()
 kmsLabel.text = "Kms: 5.2"
 summaryStack.addArrangedSubview(kmsLabel)

 caloriesLabel = UILabel()
 caloriesLabel.text = "Calories: 300"
 summaryStack.addArrangedSubview(caloriesLabel)

 durationLabel = UILabel()
 durationLabel.text = "Duration: 1h 15m"
 summaryStack.addArrangedSubview(durationLabel)

 summaryStack.addArrangedSubview(imageFitness)

 //summaryStack.isLayoutMarginsRelativeArrangement = true
 //summaryStack.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)

 stackView.addArrangedSubview(summaryStack)
 }


 /*
  func addGoalsStackToStackView() {
  let goalsStack = UIStackView()
  goalsStack.axis = .horizontal
  goalsStack.spacing = 10

  // Agregar el label "Goals"
  let goalsLabel = UILabel()
  goalsLabel.text = "Goals"
  goalsLabel.font = .boldSystemFont(ofSize: 20)
  goalsStack.addArrangedSubview(goalsLabel)

  // Agregar componentes para las metas (Kms a realizar, Calorías a alcanzar, Duración de ejercicios)
  let kmsGoalLabel = UILabel()
  kmsGoalLabel.text = "Kms: 10"
  goalsStack.addArrangedSubview(kmsGoalLabel)

  let caloriesGoalLabel = UILabel()
  caloriesGoalLabel.text = "Calories: 500"
  goalsStack.addArrangedSubview(caloriesGoalLabel)

  let durationGoalLabel = UILabel()
  durationGoalLabel.text = "Duration: 2h"
  goalsStack.addArrangedSubview(durationGoalLabel)

  // Agregar restricciones para el espaciado interno del goalsStack
  goalsStack.isLayoutMarginsRelativeArrangement = true
  goalsStack.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)

  stackView.addArrangedSubview(goalsStack)
  }
  */

 func setStackViewConstraints() {
 stackView.translatesAutoresizingMaskIntoConstraints = false
 stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
 stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
 stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
 stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
 }

 }

 //MARK: - InsertDataViewControllerDelegate
 extension HomeViewController: InsertDataViewControllerDelegate {
 func didInsertData(_ data: Stadistic) {
 //let kmsLabel = UILabel()
 kmsLabel.text = "Kms: \(data.kmString)"
 caloriesLabel.text = "Calories: \(data.calories)"
 }

 }
 */
