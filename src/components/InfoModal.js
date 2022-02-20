import { ReactComponent as Github } from '../data/Github.svg'
import { ReactComponent as Close } from '../data/Close.svg'
import Modal from 'react-modal'

Modal.setAppElement('#root')

export const InfoModal = ({ isOpen, handleClose, darkMode, styles }) => (
  <Modal isOpen={isOpen} onRequestClose={handleClose} style={styles} contentLabel="Game Info Modal">
    <div className={`h-full ${darkMode ? 'dark' : ''}`}>
      <button
        className="absolute top-4 right-4 rounded-full nm-flat-background dark:nm-flat-background-dark text-primary dark:text-primary-dark p-1 w-6 h-6 sm:p-2 sm:h-8 sm:w-8 hover:nm-inset-background dark:hover:nm-inset-background-dark"
        onClick={handleClose}
      >
        <Close />
      </button>
      <div className="h-full flex flex-col items-center justify-center max-w-[390px] mx-auto pt-9 text-primary dark:text-primary-dark">
        <div className="flex-1 w-full sm:text-base text-sm">
          <h1 className="text-center sm:text-3xl text-2xl">Τοῦ παιγνίου οἱ κανόνες</h1>
          <ul className="list-disc pl-5 block sm:text-base text-sm">
            <li className="mt-6 mb-2">Ἔξεστί σοι ἑξάκις στοχάζεσθαι τὴν λύσιν.</li>
            <li className="mb-2">Πάντα δεῖ Ἑλληνιστὶ μὲν γράφειν, μηδὲ τὰ τυχόντα γράμματα ἐμβάλλειν.</li>
            <li className="mb-2">
               Ἐπειδὰν στόχον νέον γράψῃς, πᾶν γράμμα γενήσεται πράσινον ἢ ξανθὸν ἢ καὶ γλαυκόν.
            </li>
          </ul>
          <div className="mb-3 mt-8 flex items-center">
            <span className="nm-inset-n-green text-gray-50 inline-flex items-center justify-center text-3x w-10 h-10 rounded-full">
              Γ
            </span>
            <span className="mx-2">=</span>
            <span>Ὀρθὸν γράμμα τε καὶ ὀρθὴ θέσις</span>
          </div>
          <div className="mb-3">
            <span className="nm-inset-yellow-500 text-gray-50 inline-flex items-center justify-center text-3x w-10 h-10 rounded-full">
              Γ
            </span>
            <span className="mx-2">=</span>
            <span>Ὀρθὸν μὲν γράμμα ἔγραψας, ἥμαρτες δὲ τῆς ὀρθῆς θέσεως</span>
          </div>
          <span className="nm-inset-n-gray text-gray-50 inline-flex items-center justify-center text-3x w-10 h-10 rounded-full">
            Γ
          </span>
          <span className="mx-2">=</span>
          <span>Τοῦτο τὸ γράμμα οὔκ ἐστιν μέρος λόγου</span>
        </div>
        <div className="flex justify-center sm:text-base text-sm">
          <span>Τὴν σκυτάλην εὑρήσεις ἐνθάδε</span>
          <a
            className="ml-[6px] rounded-full h-5 w-5 sm:h-6 sm:w-6"
            href="https://github.com/dspinellis/word-master-ancient-greek"
            target="_blank"
            rel="noreferrer"
          >
            <Github />
          </a>
        </div>
      </div>
    </div>
  </Modal>
)
