# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    head, contents, informations = [], [], []
    tsv.split("\n").each_with_index do |element, index|
      index == 0 ? head << element.split("\t") : contents << element.split("\t")
    end
    head = head.flatten
    0.upto(contents.size - 1) { |i| informations << Hash[head.zip contents[i]] }
    @data = informations
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    head = @data[0].keys.join("\t")
    contents = ''
    @data.each do |info|
      contents << info.values.join("\t") << "\n"
    end
    "#{head}\n#{contents}"
  end
end
