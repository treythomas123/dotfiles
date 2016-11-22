module.exports = {
  config: {
    fontSize: 12,
    fontFamily: 'MesloPowerline',
    cursorColor: 'rgba(0,0,0,0.4)',
    cursorShape: 'BLOCK',

    // custom css to embed in the main window
    css: `
        header {
            background-color: #262626;
            height: 30px;
            line-height: 30px;
        }
        .tabs_title {
            line-height: 30px;
        }
        .terms_terms {
            margin-top: 34px;
        }
    `,

    // custom css to embed in the terminal window
    termCSS: `
        @font-face {
            font-family: "MesloPowerline";
            src: url('file:///Users/trey/dotfiles/home/.fonts/powerline/Meslo/Meslo LG M Regular for Powerline.otf') format('opentype');
        }
    `,

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '',

    foregroundColor: '#fff',
    backgroundColor: '#303030',
    borderColor: '#333',
    colors: {
      black: '#303030',
      red: '#ff5f5f',
      green: '#afd787',
      yellow: '#d7d7af',
      blue: '#87d7ff',
      magenta: '#d7afd7',
      cyan: '#87d7af',
      white: '#d7d7d7',
      lightBlack: '#303030',
      lightRed: '#ff5f5f',
      lightGreen: '#afd787',
      lightYellow: '#d7d7af',
      lightBlue: '#87d7ff',
      lightMagenta: '#d7afd7',
      lightCyan: '#87d7af',
      lightWhite: '#d7d7d7',
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    shell: '',

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to false for no bell
    bell: false,

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],
};
