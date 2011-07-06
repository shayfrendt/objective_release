require 'spec_helper'
require 'fileutils'

module ObjectiveRelease
  describe Release do
    
    context ".update_bundle_version" do
      
      let(:test_plist_contents) { <<-EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleName</key>
	<string>Objective Release Sample</string>
	<key>CFBundleVersion</key>
	<string>1.42</string>
</dict>
</plist>
EOF
}

      let(:updated_plist_contents) { <<-EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleName</key>
	<string>Objective Release Sample</string>
	<key>CFBundleVersion</key>
	<string>1.43</string>
</dict>
</plist>
EOF
}

      let(:sample_plist_file) { fixture_file_path("Test.plist") }

      before do
        FileUtils.rm_rf(sample_plist_file)
        test_file = File.open(sample_plist_file, 'w') do |f|
          f.write(test_plist_contents)
        end
      end
     
      it "increments the minor version by 1" do
        release = Release.new
        release.update_bundle_version(sample_plist_file)
        File.read(sample_plist_file).should == updated_plist_contents
      end
    end

  end
end

