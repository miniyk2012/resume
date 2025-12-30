module Jekyll
  class MultiLangDataReader < Generator
    safe true
    priority :highest

    def generate(site)
      # Load English data files
      data_en_dir = File.join(site.source, '_data-en')
      if Dir.exist?(data_en_dir)
        site.data['en'] = {}
        Dir.glob(File.join(data_en_dir, '*.{yml,yaml,json,csv}')).each do |f|
          key = File.basename(f, File.extname(f))
          site.data['en'][key] = SafeYAML.load_file(f)
        end
      end
    end
  end
end
