=begin
https://launchschool.com/exercises/ba813e5c
=end

class InvalidCodonError < StandardError; end

class Translation
  CODON_TO_AMINO_ACID = {
    %w(AUG)             => 'Methionine',
    %w(UUU UUC)         => 'Phenylalanine',
    %w(UUA UUG)         => 'Leucine',
    %w(UCU UCC UCA UCG) => 'Serine',
    %w(UAU UAC)         => 'Tyrosine',
    %w(UGU UGC)         => 'Cysteine',
    %w(UGG)             => 'Tryptophan',
    %w(UAA UAG UGA)     => 'STOP'
  }.freeze

  def self.of_codon(cdn)
    protein = nil

    CODON_TO_AMINO_ACID.each do |k, v|
      protein = v if k.include?(cdn)
    end

    protein
  end

  def self.of_rna(strnd)
    strnd.each_char { |c| raise InvalidCodonError if !%w(A C G U).include?(c) }
    proteins = []
    codons = self.strand_to_codons(strnd)
    codons.each do |codon|
      break if self.of_codon(codon) == 'STOP'
      proteins << self.of_codon(codon) if self.of_codon(codon)
    end

    proteins
  end

  private

  def self.strand_to_codons(strnd)
    codons = []
    codon = ''
    strnd.each_char.with_index do |char, idx|
      codon << char
      if (idx + 1) % 3 == 0
        codons << codon
        codon = ''
      end
    end
    codons
  end
end
