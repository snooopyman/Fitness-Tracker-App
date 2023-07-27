import UIKit

class HomeViewController: UIViewController {

    let stackView = UIStackView()

    private lazy var imageFitness: UIImageView = {
        let imageName = "fitness.png"

        guard let image = UIImage(named: imageName) else {
            fatalError("No se ha cargado la imagen")
        }

        let imageView = UIImageView(image: image)

        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

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
        addGoalsStackToStackView() // Stack horizontal para metas

        setStackViewConstraints()
    }

    func addSummaryStackToStackView() {
        let summaryStack = UIStackView()
        summaryStack.axis = .vertical
        summaryStack.spacing = 10

        // Agregar el label "Summary"
        let summaryLabel = UILabel()
        summaryLabel.text = "Summary"
        summaryLabel.font = .boldSystemFont(ofSize: 20)
        summaryStack.addArrangedSubview(summaryLabel)

        // Agregar componentes para el resumen diario (Kms, Calorías, Duración)
        let kmsLabel = UILabel()
        kmsLabel.text = "Kms realizados: 5.2"
        summaryStack.addArrangedSubview(kmsLabel)

        let caloriesLabel = UILabel()
        caloriesLabel.text = "Calorías quemadas: 300"
        summaryStack.addArrangedSubview(caloriesLabel)

        let durationLabel = UILabel()
        durationLabel.text = "Duración de ejercicios: 1h 15m"
        summaryStack.addArrangedSubview(durationLabel)

        // Agregar aquí la gráfica (puedes usar una librería de gráficos o construir tu propia vista personalizada)
        summaryStack.addArrangedSubview(imageFitness)

        // Agregar restricciones para el espaciado interno del summaryStack
        summaryStack.isLayoutMarginsRelativeArrangement = true
        summaryStack.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)

        stackView.addArrangedSubview(summaryStack)
    }

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

    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
    }
}
