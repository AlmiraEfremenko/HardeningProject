//
//  FirstStageMarkView.swift
//  HardeningProject
//
//  Created by MAC on 11.12.2022.
//

import UIKit

// Сделать чтобы при нажатии всех 14 кнопок осуществлялся переход во 2 этап
protocol FirstStageMarkViewProtocol: AnyObject {

    func changesInCalendar()
}

class FirstStageMarkView: UIView {

    // MARK: - Property

    weak var firstStageMarkDeledate: FirstStageMarkViewProtocol?

    private let titleLarge = UILabel(text: "Cделай отметку первого этапа закаливания",
                                     textAlignment: .center,
                                     color:  .black,
                                     font: .systemFont(ofSize: 20, weight: .bold))

    private lazy var stackViewOne = configuraStackView()
    private lazy var stackViewTwo = configuraStackView()
    private lazy var stackViewThree = configuraStackView()
    private lazy var stackViewFour = configuraStackView()

    private lazy var buttonOne = configuraButtonMark(text: "1")
    private lazy var buttonTwo = configuraButtonMark(text: "2")
    private lazy var buttonThree = configuraButtonMark(text: "3")
    private lazy var buttonFour = configuraButtonMark(text: "4")
    private lazy var buttonFive = configuraButtonMark(text: "5")
    private lazy var buttonSix = configuraButtonMark(text: "6")
    private lazy var buttonSeven = configuraButtonMark(text: "7")
    private lazy var buttonEight = configuraButtonMark(text: "8")
    private lazy var buttonNine = configuraButtonMark(text: "9")
    private lazy var buttonTen = configuraButtonMark(text: "10")
    private lazy var buttonEleven = configuraButtonMark(text: "11")
    private lazy var buttonTwelve = configuraButtonMark(text: "12")
    private lazy var buttonThirteen = configuraButtonMark(text: "13")
    private lazy var buttonFourteen = configuraButtonMark(text: "14")

    private lazy var buttonToSecondStage = StartOrFollowButton(text: "Перейти во 2 этап")

    var toSecondStage: (() -> Void)?

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()

        buttonToSecondStage.addTarget(self, action: #selector(tapButtonSecondStage), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Hierarchy

    private func setupHierarchy() {
        addSubview(titleLarge)
        addSubview(stackViewOne)
        addSubview(stackViewTwo)
        addSubview(stackViewThree)
        addSubview(stackViewFour)
        stackViewOne.addArrangedSubview(buttonOne)
        stackViewOne.addArrangedSubview(buttonTwo)
        stackViewOne.addArrangedSubview(buttonThree)
        stackViewOne.addArrangedSubview(buttonFour)
        stackViewTwo.addArrangedSubview(buttonFive)
        stackViewTwo.addArrangedSubview(buttonSix)
        stackViewTwo.addArrangedSubview(buttonSeven)
        stackViewTwo.addArrangedSubview(buttonEight)
        stackViewThree.addArrangedSubview(buttonNine)
        stackViewThree.addArrangedSubview(buttonTen)
        stackViewThree.addArrangedSubview(buttonEleven)
        stackViewThree.addArrangedSubview(buttonTwelve)
        stackViewFour.addArrangedSubview(buttonThirteen)
        stackViewFour.addArrangedSubview(buttonFourteen)
        addSubview(buttonToSecondStage)
    }

    // MARK: - Layout

    private func setupLayout() {

        NSLayoutConstraint.activate([
        titleLarge.topAnchor.constraint(equalTo: topAnchor, constant: 140),
        titleLarge.centerXAnchor.constraint(equalTo: centerXAnchor),
        titleLarge.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        titleLarge.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

        stackViewOne.topAnchor.constraint(equalTo: titleLarge.bottomAnchor, constant: 40),
        stackViewOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        stackViewOne.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

        stackViewTwo.topAnchor.constraint(equalTo: stackViewOne.bottomAnchor, constant: 18),
        stackViewTwo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        stackViewTwo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

        stackViewThree.topAnchor.constraint(equalTo: stackViewTwo.bottomAnchor, constant: 18),
        stackViewThree.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        stackViewThree.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

        stackViewFour.topAnchor.constraint(equalTo: stackViewThree.bottomAnchor, constant: 18),
        stackViewFour.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        stackViewFour.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -200),

        buttonToSecondStage.centerXAnchor.constraint(equalTo: centerXAnchor),
        buttonToSecondStage.topAnchor.constraint(equalTo: stackViewFour.bottomAnchor, constant: 40),
        buttonToSecondStage.heightAnchor.constraint(equalToConstant: 55),
        buttonToSecondStage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 1.1)
        ])
    }

    // MARK: - Configura button mark

    private func configuraButtonMark(text: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle(text, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.specialViewBackground.cgColor
        button.layer.borderWidth = 2
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        button.setTitleColor(.specialViewBackground, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .heavy)
        button.addTarget(self, action: #selector(tapButtonMark), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    // MARK: - Configura stackView

    private func configuraStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }

    var count = 0

    //var toAwards: ((_ countMark: Int) -> Void)?

    // MARK: - Tap button mark

    @objc func tapButtonMark(button: UIButton) {
        button.layer.cornerRadius = 40
        button.backgroundColor = .specialViewBackground
       // button.layer.borderColor = UIColor.specialTextButton.cgColor
       // button.layer.borderWidth = 3
        button.setImage(UIImage(systemName: "checkmark")?.withTintColor(.white).withRenderingMode(.alwaysOriginal), for: .normal)
        button.setTitle(nil, for: .normal)
        count += 1
        print(count)
        button.isEnabled = false
        firstStageMarkDeledate?.changesInCalendar()
    }

    // MARK: - Tap button to second stage

    @objc func tapButtonSecondStage() {
        if count == 14 {
            toSecondStage?()
        }
    }
}
