class Person < ApplicationRecord
  validates :name, :gender, :birth_date, :cell_phone, presence: true
  validate :cell_phone_format

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

  def state
    ddd_to_estado = {
    # Região Sul
    41 => "Paraná",
    42 => "Paraná/Santa Catarina",
    43 => "Paraná",
    44 => "Paraná",
    45 => "Paraná",
    46 => "Paraná",
    47 => "Santa Catarina",
    48 => "Santa Catarina",
    49 => "Santa Catarina/Paraná",
    51 => "Rio Grande do Sul",
    53 => "Rio Grande do Sul",
    54 => "Rio Grande do Sul",
    55 => "Rio Grande do Sul",
    # Região Nordeste
    71 => "Bahia",
    73 => "Bahia",
    74 => "Bahia",
    75 => "Bahia",
    77 => "Bahia",
    79 => "Sergipe",
    81 => "Pernambuco",
    82 => "Alagoas",
    83 => "Paraíba",
    84 => "Rio Grande do Norte",
    85 => "Ceará",
    86 => "Piauí",
    87 => "Pernambuco",
    88 => "Ceará",
    89 => "Piauí",
    98 => "Maranhão",
    99 => "Maranhão",
    # Região Norte
    63 => "Tocantins",
    68 => "Acre",
    69 => "Rondônia",
    91 => "Pará",
    92 => "Amazonas",
    93 => "Pará",
    94 => "Pará",
    95 => "Roraima",
    96 => "Amapá",
    97 => "Amazonas",
    # Região Sudeste
    11 => "São Paulo",
    12 => "São Paulo",
    13 => "São Paulo",
    14 => "São Paulo",
    15 => "São Paulo",
    16 => "São Paulo",
    17 => "São Paulo",
    18 => "São Paulo",
    19 => "São Paulo",
    21 => "Rio de Janeiro",
    22 => "Rio de Janeiro",
    24 => "Rio de Janeiro",
    27 => "Espírito Santo",
    28 => "Espírito Santo",
    31 => "Minas Gerais",
    32 => "Minas Gerais",
    33 => "Minas Gerais",
    34 => "Minas Gerais",
    35 => "Minas Gerais",
    37 => "Minas Gerais",
    38 => "Minas Gerais",
    # Região Centro-Oeste
    61 => "Distrito Federal/Goiás",
    62 => "Goiás",
    64 => "Goiás",
    65 => "Mato Grosso",
    66 => "Mato Grosso",
    67 => "Mato Grosso do Sul"
  }

    ddd_to_estado[cell_phone[1..2].to_i]
  end

  def have_peoples?
    Person.count >= 1
  end
end
