## ObjectiveRelease

As a ruby programmer used to `cap deploy` for deployments, I want a simple way to deploy the iOS apps I work on.

ObjectiveRelease does two things:

* Increments your app's *minor* version number
* Generates release notes based on git commits since your last release

### System Requirements

* git
* ruby
* bundler
* iOS app

### Usage

Install the objective_release gem:

    gem install objective_release

Add a `Rakefile` like the following to your iOS project root:
    
    require 'objective_release'
    
    namespace :version do
      desc "Bump version and update release notes"
      task :bump do
        basedir = File.join(File.dirname(__FILE__), 'MyApp')
        config = File.join(basedir, "MyApp-Info.plist")       # Path to the Plist config for your iOS app
        release_notes = File.join(basedir, "RELEASE_NOTES")   # Create one of these if you don't have one

        release = ObjectiveRelease::Release.new
        release.update_bundle_version(config)
        release.update_release_notes(release_notes)
      end
    end

Then from your shell, just run the rake task:

    rake version:bump

### Examples

Here are some examples of how your local files will change after running the rake task:

* App version change:
  * https://github.com/shayfrendt/objective_release/blob/master/spec/fixtures/Config-Start.plist
  * https://github.com/shayfrendt/objective_release/blob/master/spec/fixtures/Config-End.plist
* Release notes change:
  * https://github.com/shayfrendt/objective_release/blob/master/spec/fixtures/RELEASE_NOTES_START
  * https://github.com/shayfrendt/objective_release/blob/master/spec/fixtures/RELEASE_NOTES_END

Definitely check out the code if you run into issues or can't figure out how this thing *should* work.

## ObjectiveRelease + BetaBuilder = Easily Deploy to TestFlight

If what you **really** want is push-button iOS deployments (I do!), and you're a [TestFlight](http://testflightapp.com) fan:

Add a Gemfile to the root of your iOS project:

``` ruby
source :rubygems

gem 'betabuilder', '0.4.1'
gem 'objective_release', '0.1.7'
```

Then add a `Rakefile` to your project root:

``` ruby
require 'rubygems'
require 'betabuilder'
require 'objective_release'

desc "Increment the version number and deploy via TestFlight"
task :bump_and_deploy => ["version:bump", "beta:deploy"]

namespace :version do
  desc "Bump version and update release notes"
  task :bump do
    basedir = File.join(File.dirname(__FILE__), 'MyApp')
    config = File.join(basedir, "MyApp-Info.plist")
    release_notes = File.join(basedir, "RELEASE_NOTES")

    release = ObjectiveRelease::Release.new
    release.update_bundle_version(config)
    release.update_release_notes(release_notes)
  end
end

BetaBuilder::Tasks.new do |config|
  config.target = "MyApp"
  config.configuration = "Distribution"
  config.deploy_using(:testflight) do |testflight|
    testflight.api_token = "your-api-token-here"
    testflight.team_token = "your-team-token-here"
    testflight.distribution_lists = %w{TestFlight Distribution List}
    testflight.generate_release_notes do
      File.open('MyApp/RELEASE_NOTES', 'rb') {|f| f.read }
    end
    testflight.notify = true
  end
end
```

Then just run `rake bump_and_deploy` and sit back and relax while your deployment is run automatically.
