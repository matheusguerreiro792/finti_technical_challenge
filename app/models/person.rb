class Person < ApplicationRecord
  include DddStateMapper

  validates :name, :gender, :birth_date, :cell_phone, presence: true
  validates :gender, inclusion: { in: %w[Masculino Feminino] }
  validates :birth_date, comparison: { less_than_or_equal_to: Date.today, message: 'não pode ser maior que a data atual' }
  validate :cell_phone_format
  validate :valid_ddd

  before_save :correct_phone_format

  def cell_phone_format
    unless cell_phone.match?(/\A\d{11}\z/)
      errors.add(:cell_phone, :invalid)
    end
  end

  def correct_phone_format
    self.cell_phone = cell_phone.strip.gsub(/(\d{2})(\d{5})(\d{4})/, '(\1) \2-\3')
    self.cell_phone
  end

  def sanitize_cell_phone
    self.cell_phone = cell_phone.gsub(/\D/, '') if cell_phone.present?
    self.cell_phone
  end

  def age
    Date.today.year - birth_date.year.to_i
  end

  def can_vote?
    age >= 16
  end

  def have_peoples?
    Person.count >= 1
  end
end
