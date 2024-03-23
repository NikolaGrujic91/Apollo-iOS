@testable import FoundationLocalization
import XCTest

final class LocalizationViewModelTests: XCTestCase {
    // MARK: - Properties

    private var localizationViewModel: LocalizationViewModel?

    // MARK: Functions

    @MainActor
    override func setUp() {
        super.setUp()
        localizationViewModel = LocalizationViewModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    @MainActor
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        localizationViewModel = nil
        super.tearDown()
    }

    @MainActor
    private func verifyEnglish() {
        if localizationViewModel?.language != .english {
            XCTFail("Language is not set to .english")
        }

        XCTAssertEqual("appearance".localized(.english), "Appearance")
        XCTAssertEqual("cancel".localized(.english), "Cancel")
        XCTAssertEqual("dark".localized(.english), "Dark")
        XCTAssertEqual("data".localized(.english), "Data")
        XCTAssertEqual("information".localized(.english), "Information")
        XCTAssertEqual("language".localized(.english), "Language")
        XCTAssertEqual("light".localized(.english), "Light")
        XCTAssertEqual("loadHealth".localized(.english), "Load from Health")
        XCTAssertEqual("pause".localized(.english), "Pause")
        XCTAssertEqual("plans".localized(.english), "Plans")
        XCTAssertEqual("reset".localized(.english), "Reset")
        XCTAssertEqual("resetLabel".localized(.english), "Reset calories and distances")
        XCTAssertEqual("resetQuestion".localized(.english), "Are you sure you want to reset calories and distances?")
        XCTAssertEqual("resume".localized(.english), "Resume")
        XCTAssertEqual("save".localized(.english), "Save")
        XCTAssertEqual("settings".localized(.english), "Settings")
        XCTAssertEqual("start".localized(.english), "Start")
        XCTAssertEqual("version".localized(.english), "Version:")
        XCTAssertEqual("weight".localized(.english), "Weight")
    }

    @MainActor
    private func verifyNetherlands() {
        if localizationViewModel?.language != .netherlands {
            XCTFail("Language is not set to .netherlands")
        }

        XCTAssertEqual("appearance".localized(.netherlands), "Weergave")
        XCTAssertEqual("cancel".localized(.netherlands), "Annuleren")
        XCTAssertEqual("dark".localized(.netherlands), "Donker")
        XCTAssertEqual("data".localized(.netherlands), "Gegevens")
        XCTAssertEqual("information".localized(.netherlands), "Informatie")
        XCTAssertEqual("language".localized(.netherlands), "Taal")
        XCTAssertEqual("light".localized(.netherlands), "Licht")
        XCTAssertEqual("loadHealth".localized(.netherlands), "Laden vanaf Health")
        XCTAssertEqual("pause".localized(.netherlands), "Pauze")
        XCTAssertEqual("plans".localized(.netherlands), "Plannen")
        XCTAssertEqual("reset".localized(.netherlands), "Resetten")
        XCTAssertEqual("resetLabel".localized(.netherlands), "Reset calorieën en afstanden")
        XCTAssertEqual("resetQuestion".localized(.netherlands), "Weet je zeker dat je calorieën en afstanden wilt resetten?")
        XCTAssertEqual("resume".localized(.netherlands), "Doorgaan")
        XCTAssertEqual("save".localized(.netherlands), "Opslaan")
        XCTAssertEqual("settings".localized(.netherlands), "Instellingen")
        XCTAssertEqual("start".localized(.netherlands), "Starten")
        XCTAssertEqual("version".localized(.netherlands), "Versie:")
        XCTAssertEqual("weight".localized(.netherlands), "Gewicht")
    }

    @MainActor
    private func verifyFrench() {
        if localizationViewModel?.language != .french {
            XCTFail("Language is not set to .french")
        }

        XCTAssertEqual("appearance".localized(.french), "Apparence")
        XCTAssertEqual("cancel".localized(.french), "Annuler")
        XCTAssertEqual("dark".localized(.french), "Sombre")
        XCTAssertEqual("data".localized(.french), "Donnés")
        XCTAssertEqual("information".localized(.french), "Information")
        XCTAssertEqual("language".localized(.french), "Langue")
        XCTAssertEqual("light".localized(.french), "Lumière")
        XCTAssertEqual("loadHealth".localized(.french), "Charge de Health")
        XCTAssertEqual("pause".localized(.french), "Pause")
        XCTAssertEqual("plans".localized(.french), "Des plans")
        XCTAssertEqual("reset".localized(.french), "Réinitialiser")
        XCTAssertEqual("resetLabel".localized(.french), "Réinitialiser les calories et les distances")
        XCTAssertEqual("resetQuestion".localized(.french), "Etes-vous sûr de vouloir réinitialiser les calories et les distances?")
        XCTAssertEqual("resume".localized(.french), "Continuer")
        XCTAssertEqual("save".localized(.french), "Sauvegarder")
        XCTAssertEqual("settings".localized(.french), "Paramètres")
        XCTAssertEqual("start".localized(.french), "Commencer")
        XCTAssertEqual("version".localized(.french), "Version:")
        XCTAssertEqual("weight".localized(.french), "Poids")
    }

    @MainActor
    private func verifyGerman() {
        if localizationViewModel?.language != .german {
            XCTFail("Language is not set to .german")
        }

        XCTAssertEqual("appearance".localized(.german), "Aussehen")
        XCTAssertEqual("cancel".localized(.german), "Stornieren")
        XCTAssertEqual("dark".localized(.german), "Dunkel")
        XCTAssertEqual("data".localized(.german), "Daten")
        XCTAssertEqual("information".localized(.german), "Information")
        XCTAssertEqual("language".localized(.german), "Sprache")
        XCTAssertEqual("light".localized(.german), "Licht")
        XCTAssertEqual("loadHealth".localized(.german), "Aus Health laden")
        XCTAssertEqual("pause".localized(.german), "Pause")
        XCTAssertEqual("plans".localized(.german), "Pläne")
        XCTAssertEqual("reset".localized(.german), "Zurücksetzen")
        XCTAssertEqual("resetLabel".localized(.german), "Kalorien und Distanzen zurücksetzen")
        XCTAssertEqual("resetQuestion".localized(.german), "Sind Sie sicher, dass Sie Kalorien und Distanzen zurücksetzen möchten?")
        XCTAssertEqual("resume".localized(.german), "Wieder aufnehmen")
        XCTAssertEqual("save".localized(.german), "Speichern")
        XCTAssertEqual("settings".localized(.german), "Einstellungen")
        XCTAssertEqual("start".localized(.german), "Start")
        XCTAssertEqual("version".localized(.german), "Ausführung:")
        XCTAssertEqual("weight".localized(.german), "Gewicht")
    }

    @MainActor
    private func verifyPortuguese() {
        if localizationViewModel?.language != .portuguese {
            XCTFail("Language is not set to .portuguese")
        }

        XCTAssertEqual("appearance".localized(.portuguese), "Aparência")
        XCTAssertEqual("cancel".localized(.portuguese), "Cancelar")
        XCTAssertEqual("dark".localized(.portuguese), "Escuro")
        XCTAssertEqual("data".localized(.portuguese), "Dados")
        XCTAssertEqual("information".localized(.portuguese), "Informação")
        XCTAssertEqual("language".localized(.portuguese), "Linguagem")
        XCTAssertEqual("light".localized(.portuguese), "Luz")
        XCTAssertEqual("loadHealth".localized(.portuguese), "Carregar da Health")
        XCTAssertEqual("pause".localized(.portuguese), "Pausa")
        XCTAssertEqual("plans".localized(.portuguese), "Planos")
        XCTAssertEqual("reset".localized(.portuguese), "Reiniciar")
        XCTAssertEqual("resetLabel".localized(.portuguese), "Redefinir calorias e distâncias")
        XCTAssertEqual("resetQuestion".localized(.portuguese), "Tem certeza de que deseja redefinir calorias e distâncias?")
        XCTAssertEqual("resume".localized(.portuguese), "Retomar")
        XCTAssertEqual("save".localized(.portuguese), "Salvar")
        XCTAssertEqual("settings".localized(.portuguese), "Configurações")
        XCTAssertEqual("start".localized(.portuguese), "Começar")
        XCTAssertEqual("version".localized(.portuguese), "Versão:")
        XCTAssertEqual("weight".localized(.portuguese), "Peso")
    }

    @MainActor
    private func verifySpanish() {
        if localizationViewModel?.language != .spanish {
            XCTFail("Language is not set to .spanish")
        }

        XCTAssertEqual("appearance".localized(.spanish), "Apariencia")
        XCTAssertEqual("cancel".localized(.spanish), "Cancelar")
        XCTAssertEqual("dark".localized(.spanish), "Oscuro")
        XCTAssertEqual("data".localized(.spanish), "Datos")
        XCTAssertEqual("information".localized(.spanish), "Información")
        XCTAssertEqual("language".localized(.spanish), "Idioma")
        XCTAssertEqual("light".localized(.spanish), "Ligero")
        XCTAssertEqual("loadHealth".localized(.spanish), "Carga desde Health")
        XCTAssertEqual("pause".localized(.spanish), "Pausa")
        XCTAssertEqual("plans".localized(.spanish), "Planes")
        XCTAssertEqual("reset".localized(.spanish), "Reiniciar")
        XCTAssertEqual("resetLabel".localized(.spanish), "Restablecer calorías y distancias")
        XCTAssertEqual("resetQuestion".localized(.spanish), "¿Estás seguro de que quieres restablecer las calorías y las distancias?")
        XCTAssertEqual("resume".localized(.spanish), "Reanudar")
        XCTAssertEqual("save".localized(.spanish), "Ahorrar")
        XCTAssertEqual("settings".localized(.spanish), "Ajustes")
        XCTAssertEqual("start".localized(.spanish), "Comenzar")
        XCTAssertEqual("version".localized(.spanish), "Versión:")
        XCTAssertEqual("weight".localized(.spanish), "Peso")
    }

    @MainActor
    private func verifySetLanguage(_ language: LanguageCode) {
        localizationViewModel?.save(language)
        XCTAssertEqual(localizationViewModel?.language, language)

        localizationViewModel?.load()
        XCTAssertEqual(localizationViewModel?.language, language)
    }

    // MARK: - Tests

    @MainActor
    func testChangeLanguageAndVerifyTranslations() {
        XCTAssertNotNil(localizationViewModel)

        // Default language
        XCTAssertEqual(localizationViewModel?.language, .english)
        verifyEnglish()

        verifySetLanguage(.netherlands)
        verifyNetherlands()

        verifySetLanguage(.english)
        verifyEnglish()

        verifySetLanguage(.french)
        verifyFrench()

        verifySetLanguage(.german)
        verifyGerman()

        verifySetLanguage(.portuguese)
        verifyPortuguese()

        verifySetLanguage(.spanish)
        verifySpanish()
    }
}
