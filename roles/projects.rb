name "projects"
description "Run list for each project."
run_list(
  "recipe[homebrew]",          # Don't remove this
  "recipe[os_x::brew_bundle]", # Don't remove this
  "recipe[os_x::ruby]",
#  "recipe[projects::wantedly]"
)
override_attributes({
  "homebrew" => {
    "enable_cask" => true,
    "formulas" => [
      #
      # basic formulas
      #
      "git",
      "hub",
      "bash-completion",
      "ruby-build",
      "rbenv",
      "heroku-toolbelt",
      #
      # for wantedly/wantedly
      #
      "imagemagick",
#      "phantomjs",
      "openssl",
      "readline"
    ],
    "casks" => [
      "google-chrome",
#      "google-japanese-ime",  ## stash due to fail
#      "sublime-text",
#      "coteditor",
      "slack",
      "skitch",
      "evernote",
      "dropbox",
      "dropbox-encore",
#      "karabiner",
      "firefox",
#      "caffeine",
#      "postgres",
    ]
  },
  "rbenv" => {
    "user"   => ENV['HOME'].sub("\/Users\/", ""),
    "group"  => "staff",
    "root"   => "#{ENV['HOME']}/.rbenv",
    "rubies" => ["2.1.2", "2.1.3"],
    "global" => "2.1.3",
    "gems"   => {
      "2.1.2" => [
        { "name" => "bundler" },
        { "name" => "pry" },
      ],
      "2.1.3" => [
        { "name" => "bundler" },
        { "name" => "pry" },
      ]
    }
  }
})
