require 'spec_helper'
require 'fileutils'

module ObjectiveRelease
  describe Release do
    let(:release_notes_start) { File.read(fixture_file_path("RELEASE_NOTES_START")) }
    let(:release_notes_end) { File.read(fixture_file_path("RELEASE_NOTES_END")) }
    let(:config_start) { File.read(fixture_file_path("Config-Start.plist")) }
    let(:config_end) { File.read(fixture_file_path("Config-End.plist")) }

    context ".update_release_notes" do
      let(:release_notes_test_file) { fixture_file_path("RELEASE_NOTES_TEST") }
      
      before do
        FileUtils.rm_rf(release_notes_test_file)
        test_file = File.open(release_notes_test_file, 'w') do |f|
          f.write(release_notes_start)
        end
      end

      it "includes the current app version number" do
        release = Release.new
        release.update_release_notes(release_notes_test_file)
        File.read(release_notes_test_file).should == release_notes_end
      end
    end
    
    context ".update_bundle_version" do
      let(:config_test_file) { fixture_file_path("Config-Test.plist") }
      
      before do
        FileUtils.rm_rf(config_test_file)
        test_file = File.open(config_test_file, 'w') do |f|
          f.write(config_start)
        end
      end
     
      it "increments the minor version by 1" do
        release = Release.new
        release.update_bundle_version(config_test_file)
        File.read(config_test_file).should == config_end
      end
    end

  end
end

