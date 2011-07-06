## ObjectiveRelease

This goal of this project is to automate the deployment of iOS applications as much as possible.  I use ruby as a scripting language, and am bringing it into the Objective-C world because it's an awesome scripting language.

Add the following to your iOS project's `Rakefile` to make nice releases:
    
    require 'objective_release'
    
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

