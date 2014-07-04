Award = Struct.new(:name, :expires_in, :quality) do

  # Default methods for every award

  # Need two methods to handle :expires_in param
  def expired?
    expires_in < 0
  end

  def decrease_expiry
    self.expires_in -= 1
  end

  # Need three methods to handle :quality params
  def update_quality
    decrease_expiry
    decrease_quality
    decrease_quality if expired?
  end

  def decrease_quality
    self.quality -= 1 unless self.quality == 0
  end

  def increase_quality
    self.quality += 1 unless (self.quality == 50 || self.quality == 80)
  end

end
