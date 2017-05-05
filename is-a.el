;;; is-a.el --- Tools for testing the environment we're running in

;;; Commentary:
;;
;; is-a.el provides tools for testing the environment we're runnuing in.
;;
;; Note that these tests aren't intended to be comprehensive. They're just
;; good enough to cover the range of machines and environments I own and
;; use.

;;; Code:

(defconst is-a-win32p
  (eq system-type 'windows-nt)
  "Are we running on a WinTel system?")

(defconst is-a-linuxp
  (or (eq system-type 'gnu/linux)
      (eq system-type 'linux))
  "Are we running on a GNU/Linux system?")

(defconst is-a-linux-x-p
  (and window-system is-a-linuxp)
  "Are we running under X on a GNU/Linux system?")

(defconst is-a-linux-terminal-p
  (and (not window-system) is-a-linuxp)
  "Are we running on GNU/Linux, in a terminal?")

(defconst is-a-linux-console-p
  (and is-a-linux-terminal-p (string= (getenv "TERM") "linux"))
  "Does it look like we're on a Linux console?")

(defconst is-a-macOS-p
  (eq system-type 'darwin)
  "Are we running on some form of macOS?")

(defconst is-a-macOS-terminal-p
  (and is-a-macOS-p (not window-system))
  "Are we running in an macOS terminal?")

(defconst is-a-macOS-window-p
  (and is-a-macOS-p (not is-a-macOS-terminal-p))
  "Are we running in an macOS window?")

(defconst is-a-unixp
  (or is-a-linuxp is-a-macOS-p)
  "Are we on some form of Unix?")

(defconst is-a-unix-window-p
  (and is-a-unixp window-system)
  "Are we on some form of Unix and in a graphical environment?")

(defconst is-a-unix-terminal-p
  (and is-a-unixp (not window-system))
  "Are we on some form of Unix but not running as a graphical app?")

(defconst is-a-rootp
  (and is-a-unixp (zerop (user-uid)))
  "Are we running as root?")

(provide 'is-a)

;;; is-a.el ends here
