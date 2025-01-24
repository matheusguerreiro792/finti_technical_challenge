module DddStateMapper
  extend ActiveSupport::Concern

  included do
    cattr_accessor :ddd_to_state
    self.ddd_to_state = load_ddd_to_state
  end

  class_methods do
    def load_ddd_to_state
      YAML.load_file(Rails.root.join("config", "ddd_to_state.yml"))["ddd_to_state"]
    rescue Errno::ENOENT, Psych::SyntaxError => e
      Rails.logger.error("Error loading ddd_to_state.yml: #{e.message}")
      {}
    end
  end

  def state
    @state ||= begin
      ddd = cell_phone[1, 2]
      self.class.ddd_to_state[ddd] || "Desconhecido"
    end
  end

  def valid_ddd
    unless self.class.ddd_to_state.key?(cell_phone[0, 2])
      errors.add(:cell_phone, :invalid)
    end
  end
end
