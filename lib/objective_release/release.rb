module ObjectiveRelease
  class Release
    def update_bundle_version(plist_file)
      parsed_plist = parse_plist(plist_file)
      version_string = parsed_plist['CFBundleVersion']
      parsed_plist['CFBundleVersion'] = increment_version(version_string)
      exported_plist = Plist::Emit.dump(parsed_plist)
      export_plist(plist_file, exported_plist)
    end

    def update_release_notes(release_notes_file)
      contents = "foo"
      export_release_notes(release_notes_file, contents)
    end
    
    private
    
    def parse_plist(plist)
      Plist::parse_xml plist
    end
    
    def zerofill(number)
      sprintf("%02d", number)
    end

    def increment_version(version_string)
      if version_string =~ /(\d+)\.(\d+)/
        major = $1.to_i
        minor = $2.to_i
        return "#{major}.#{zerofill(minor + 1)}"
      else
        raise "Version number could not be incremented."
      end
    end

    def export_plist(file, contents)
      contents.gsub!("Apple Computer", "Apple")
      File.open(file, 'w+') do |f|
        f.write contents
      end
    end

    def export_release_notes(file, contents)
      File.open(file, 'w+') do |f|
        f.write contents
      end
    end
  end
end
