class Version < Sequel::Model
  class Create < Trailblazer::Operation
    step Model(Version, :new)
    step :read_data
    step :compute_sha_hash
    step :read_text
    success :find_isbn
    step :persist

    def read_data(options, filepath:, **)
      options["my.data"] = File.read filepath
    end

    def compute_sha_hash(options, model:, **)
      model[:sha_hash] = Digest::SHA256.hexdigest(options["my.data"])
    end

    def read_text(options, **)
      options["my.text"] = Henkei.read :text, options["my.data"]
    end

    def find_isbn(options, model:, **)
      match = options["my.text"].scrub.match(Regexp.union(ISBNExtractor::REGEXPS))
      isbns = match.captures.compact.select { |string| ISBNCheck.valid? string.gsub!(/\W/, '') }
      model[:isbn] = isbns.first
    end

    def persist(options, model:, **)
      model.save
    end
  end
end
