class GeneratePhrases
  def perform(phrase_class = Phrase)
    return if phrase_class.count == 10

    phrase_class.delete_all
    (1..10).each { |id| phrase_class.create(value: "Phrase #{id}") }
  end
end
