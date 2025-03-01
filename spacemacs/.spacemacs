;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(ansible
     protobuf
     ;; nginx
     ;; typescript
     ;; javascript
     ;; html
     yaml
     ;; rust
     lsp
     terraform
     ;; python
     ;; yaml
     ;; markdown
     ;; javascript
     ;; typescript
     ;; helm
     ;; emacs-lisp
     git
     (go :variables
         go-tab-width 4
         go-format-before-save t
         )
     json
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-shell 'eshell
     ;;        shell-default-position 'bottom
     ;;        shell-default-full-span nil
     ;;        )
     colors
     syntax-checking
     auto-completion
     org
     ;; restclient
     ;; confluence
     )
   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages
   '(
     ;; editorconfig
     jq-mode
     )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light). A theme from external
   ;; package can be defined with `:package', or a theme can be defined with
   ;; `:location' to download the theme package, refer the themes section in
   ;; DOCUMENTATION.org for the full theme specifications.
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. This setting has no effect when
   ;; running Emacs in terminal. The font set here will be used for default and
   ;; fixed-pitch faces. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '( "Meslo LG M for Powerline"
                               ;;"Fira Code"
                               :size 12.0
                               :weight normal
                               :width normal
                               ;;:powerline-scale 1.05
                               )
   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; It is also possible to use a posframe with the following cons cell
   ;; `(posframe . position)' where position can be one of `center',
   ;; `top-center', `bottom-center', `top-left-corner', `top-right-corner',
   ;; `top-right-corner', `bottom-left-corner' or `bottom-right-corner'
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; Whether side windows (such as those created by treemacs or neotree)
   ;; are kept or minimized by `spacemacs/toggle-maximize-window' (SPC w m).
   ;; (default t)
   dotspacemacs-maximize-window-keep-side-windows t

   ;; If nil, no load-hints enabled. If t, enable the `load-hints' which will
   ;; put the most likely path on the top of `load-path' to reduce walking
   ;; through the whole `load-path'. It's an experimental feature to speedup
   ;; Spacemacs on Windows. Refer the FAQ.org "load-hints" session for details.
   dotspacemacs-enable-load-hints nil

   ;; If t, enable the `package-quickstart' feature to avoid full package
   ;; loading, otherwise no `package-quickstart' attemption (default nil).
   ;; Refer the FAQ.org "package-quickstart" section for details.
   dotspacemacs-enable-package-quickstart nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling nil

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; The backend used for undo/redo functionality. Possible values are
   ;; `undo-fu', `undo-redo' and `undo-tree' see also `evil-undo-system'.
   ;; Note that saved undo history does not get transferred when changing
   ;; your undo system. The default is currently `undo-fu' as `undo-tree'
   ;; is not maintained anymore and `undo-redo' is very basic."
   dotspacemacs-undo-system 'undo-fu

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "Emacs"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; The variable `global-spacemacs-whitespace-cleanup-modes' controls
   ;; which major modes have whitespace cleanup enabled or disabled
   ;; by default.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."

  ;; (defun spaceline-custom-theme (&rest additional-segments)
  ;;   "My custom spaceline theme."
  ;;   (spaceline-compile
  ;;     '(
  ;;       ;; projectile-root --- this and the following line were slowing down the whole editor
  ;;       ;; relative-path
  ;;       buffer-id process)
  ;;     '(org-clock selection-info major-mode line-column ,@additional-segments))
  ;;   (setq-default mode-line-format '("%e" (:eval (spaceline-ml-main)))))

  (custom-set-variables '(spacemacs-theme-custom-colors
                          '(
                            (act1 . "#1f1f1f")
                            (act2 . "#151515")
                            (base . "#b2b2b2")
                            (base-dim . "#686868")
                            (bg1 . "#222222")
                            (bg2 . "#171717")
                            (bg3 . "#080808")
                            (bg4 . "#040404")
                            (border . "#333333")
                            (cblk . "#cbc1d5")
                            (cblk-bg . "#2f2b33")
                            (cblk-ln . "#627591")
                            (cblk-ln-bg . "#273040")
                            (cursor . "#e3dedd")
                            (const . "#4fb7d7")
                            (comment . "#8a9ea0")
                            (comment-light . "#2aa1ae")
                            (comment-bg . nil)
                            (comp . "#4fb7d7")
                            (err . "#b00000")
                            (func . "#3f94bc")
                            (head1 . "#4fb7d7")
                            (head1-bg . "#293239")
                            (head2 . "#4dd474")
                            (head2-bg . "#293235")
                            (head3 . "#67b11d")
                            (head3-bg . "#293235")
                            (head4 . "#b1951d")
                            (head4-bg . "#32322c")
                            (highlight . "#344155")
                            (highlight-dim . "#2b314d")
                            (keyword . "#888888")
                            (lnum . "#44505c")
                            (mat . "#6888a8")
                            (meta . "#9f8766")
                            (str . "#0dc4a4")
                            (suc . "#86dc2f")
                            (ttip . "#9a9aba")
                            (ttip-sl . "#3e5079")
                            (ttip-bg . "#34323e")
                            (type . "#ffcc77")
                            (var . "#35a0fb")
                            (war . "#dc752f")
                            )))
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  ;; window size at startup
  (setq initial-frame-alist
        (append initial-frame-alist
                '((left   . 0.5)
                  (top    . 0.5)
                  (width  . 180)
                  (height . 0.95))))

  ;; Reduce garbage collection frequency
  (setq gc-cons-threshold 200000000)
  (run-with-idle-timer 5 t #'garbage-collect)

  ;; org
  (setq org-startup-indented t)
  (setq org-confirm-babel-evaluate nil)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "xh" 'org-toggle-heading)
  (require 'org-tempo) ;; fix tab-expansion of "<s" in org-mode

  ;; lsp
  (setq lsp-signature-auto-activate nil) ;; don't automatically pop up help at the bottom in LSP mode
  (setq lsp-ui-doc-enable nil) ;; don't show hovering doc window for what's under the cursor (gets in the way and slows down movement)
  ;; (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-ui-sideline-diagnostic-max-lines 10) ;; show more lines of output when the cursor is on a compile error (default was 1)

  ;; go
  (add-to-list 'exec-path "/opt/homebrew/opt/go@1.23/bin")

  ;; evil
  (setq-default evil-kill-on-visual-paste nil)
  (setq-default ediff-forward-word-function 'forward-char)
  ;; Move visual block using c-j and c-k
  (define-key evil-visual-state-map "\C-J"
    (concat ":m '>+1" (kbd "RET") "gv=gv"))
  (define-key evil-visual-state-map "\C-K"
    (concat ":m '<-2" (kbd "RET") "gv=gv"))

  ;; Indentation defaults to 2 spaces
  (setq-default js-indent-level 2)
  (setq-default js2-basic-offset 2)
  (setq-default typescript-indent-level 2)
  (setq-default css-indent-offset 2)
  (setq sh-basic-offset 2)

  ;; Misc config
  (editorconfig-mode 1)
  ;; (global-auto-revert-mode 0) ;; spacemacs turns this on by default
  (setq-default line-spacing 1)
  (setq vc-follow-symlinks t)
  (setq helm-buffer-skip-remote-checking t)
  (setq make-backup-files nil) ;; stop creating ~ files
  (setq helm-buffer-max-length 35)
  (setq create-lockfiles nil)

  ;; magit
  (setq git-magit-status-fullscreen t)

  (defun my-magit-insert-status-headers ()
    "Insert headers appropriate for the current status buffer."
    (magit-insert-error-header)
    (magit-insert-diff-filter-header)
    (magit-insert-head-branch-header)
    (magit-insert-upstream-branch-header)
    (magit-insert-push-branch-header)
    ;;magit-insert-tags-header) ;; removed tags because they were slowing down status of large repo
    )

  (defun my-insert-newline ()
    "Insert a newline character."
    (insert "\n"))

  ;; Just show the count, not all the details. Details were slow because of lots of tags in large repo.
  (defun my-magit-insert-unpushed-to-pushremote ()
    "Insert a section showing the number of commits not pushed to the push-remote."
    (when-let* ((target (magit-get-push-branch))
                (range  (concat target "..")))
      (let ((count (string-to-number (shell-command-to-string (concat "git rev-list --count " range)))))
        (when (> count 0)
          (magit-insert-section (unpushed)
            (magit-insert-heading (format "Unpushed commits (to %s): %d" target count)))
          (insert "\n")))))  ;; Insert newline after the section

  (setq magit-status-sections-hook
    '(my-magit-insert-status-headers
      my-insert-newline
      my-magit-insert-unpushed-to-pushremote
      magit-insert-merge-log
      magit-insert-rebase-sequence
      magit-insert-am-sequence
      magit-insert-sequencer-sequence
      magit-insert-bisect-output
      magit-insert-bisect-rest
      magit-insert-bisect-log
      magit-insert-untracked-files
      magit-insert-unstaged-changes
      magit-insert-staged-changes
      magit-insert-stashes
      ;; magit-insert-unpushed-to-upstream-or-recent
      ;; magit-insert-unpulled-from-pushremote
      ;; magit-insert-unpulled-from-upstream
      ))

  ;; projectile
  (with-eval-after-load 'projectile
    (setq projectile-project-root-files-bottom-up '(".projectile" "go.mod" ".git")))
  (with-eval-after-load 'projectile
    (projectile-register-project-type 'go '("go.mod")
                                      :project-file "go.mod"
                                      :compile "go build ./..."
                                      :test "go test ./..."
                                      :run "go run ./..."
                                      :test-suffix "_test.go"))

  ;; Additional keybindings
  (global-set-key (kbd "C-`") 'compare-windows)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(org-agenda-files (quote ("~/Dropbox/org/refile-beorg.org")))
 '(package-selected-packages
   (quote
    (lv transient string-inflection csv-mode lsp-mode ng2-mode treepy graphql terraform-mode hcl-mode org-mime ghub let-alist web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode atomic-chrome websocket prettier-js thrift yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic restclient-helm ob-restclient ob-http company-restclient restclient know-your-http-well org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download htmlize gnuplot puppet-mode fireplace xkcd helm-company helm-c-yasnippet fuzzy flycheck-pos-tip pos-tip company-web web-completion-data dash-functional company-statistics company-go auto-yasnippet ac-ispell auto-complete go-guru go-eldoc go-mode nginx-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby yaml-mode groovy-mode rainbow-mode rainbow-identifiers color-identifiers-mode all-the-icons memoize font-lock+ tern sql-indent tide typescript-mode flycheck editorconfig web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc coffee-mode mmm-mode markdown-toc markdown-mode gh-md xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help noflet company yasnippet sbt-mode scala-mode smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit with-editor ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(paradox-github-token t)
 '(spacemacs-theme-custom-colors
   (quote
    ((act1 . "#1f1f1f")
     (act2 . "#151515")
     (base . "#b2b2b2")
     (base-dim . "#686868")
     (bg1 . "#222222")
     (bg2 . "#171717")
     (bg3 . "#080808")
     (bg4 . "#040404")
     (border . "#333333")
     (cblk . "#cbc1d5")
     (cblk-bg . "#2f2b33")
     (cblk-ln . "#627591")
     (cblk-ln-bg . "#273040")
     (cursor . "#e3dedd")
     (const . "#4fb7d7")
     (comment . "#8a9ea0")
     (comment-light . "#2aa1ae")
     (comment-bg)
     (comp . "#4fb7d7")
     (err . "#b00000")
     (func . "#3f94bc")
     (head1 . "#4fb7d7")
     (head1-bg . "#293239")
     (head2 . "#4dd474")
     (head2-bg . "#293235")
     (head3 . "#67b11d")
     (head3-bg . "#293235")
     (head4 . "#b1951d")
     (head4-bg . "#32322c")
     (highlight . "#344155")
     (highlight-dim . "#2b314d")
     (keyword . "#888888")
     (lnum . "#44505c")
     (mat . "#86dc2f")
     (meta . "#9f8766")
     (str . "#0dc4a4")
     (suc . "#86dc2f")
     (ttip . "#9a9aba")
     (ttip-sl . "#3e5079")
     (ttip-bg . "#34323e")
     (type . "#ffcc77")
     (var . "#35a0fb")
     (war . "#dc752f")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(org-agenda-files '("~/Dropbox/org/refile-beorg.org"))
 '(package-selected-packages
   '(ansible ansible-doc company-ansible jinja2-mode lv transient string-inflection csv-mode lsp-mode ng2-mode treepy graphql terraform-mode hcl-mode org-mime ghub let-alist web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode atomic-chrome websocket prettier-js thrift yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic restclient-helm ob-restclient ob-http company-restclient restclient know-your-http-well org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download htmlize gnuplot puppet-mode fireplace xkcd helm-company helm-c-yasnippet fuzzy flycheck-pos-tip pos-tip company-web web-completion-data dash-functional company-statistics company-go auto-yasnippet ac-ispell auto-complete go-guru go-eldoc go-mode nginx-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby yaml-mode groovy-mode rainbow-mode rainbow-identifiers color-identifiers-mode all-the-icons memoize font-lock+ tern sql-indent tide typescript-mode flycheck editorconfig web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc coffee-mode mmm-mode markdown-toc markdown-mode gh-md xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help noflet company yasnippet sbt-mode scala-mode smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit with-editor ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))
 '(paradox-github-token t)
 '(prog-mode-hook
   '(rainbow-mode spacemacs/load-yasnippet spacemacs//trailing-whitespace rainbow-delimiters-mode spacemacs//enable-hs-minor-mode highlight-parentheses-mode highlight-numbers-mode spacemacs//load-evil-lisp-state bug-reference-prog-mode goto-address-prog-mode spacemacs//put-clean-aindent-last))
 '(spacemacs-theme-custom-colors
   '((act1 . "#1f1f1f")
     (act2 . "#151515")
     (base . "#b2b2b2")
     (base-dim . "#686868")
     (bg1 . "#222222")
     (bg2 . "#171717")
     (bg3 . "#080808")
     (bg4 . "#040404")
     (border . "#333333")
     (cblk . "#cbc1d5")
     (cblk-bg . "#2f2b33")
     (cblk-ln . "#627591")
     (cblk-ln-bg . "#273040")
     (cursor . "#e3dedd")
     (const . "#4fb7d7")
     (comment . "#8a9ea0")
     (comment-light . "#2aa1ae")
     (comment-bg)
     (comp . "#4fb7d7")
     (err . "#b00000")
     (func . "#3f94bc")
     (head1 . "#4fb7d7")
     (head1-bg . "#293239")
     (head2 . "#4dd474")
     (head2-bg . "#293235")
     (head3 . "#67b11d")
     (head3-bg . "#293235")
     (head4 . "#b1951d")
     (head4-bg . "#32322c")
     (highlight . "#344155")
     (highlight-dim . "#2b314d")
     (keyword . "#888888")
     (lnum . "#44505c")
     (mat . "#86dc2f")
     (meta . "#9f8766")
     (str . "#0dc4a4")
     (suc . "#86dc2f")
     (ttip . "#9a9aba")
     (ttip-sl . "#3e5079")
     (ttip-bg . "#34323e")
     (type . "#ffcc77")
     (var . "#35a0fb")
     (war . "#dc752f")))
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
