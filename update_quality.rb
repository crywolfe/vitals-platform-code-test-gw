require 'award'

# inherit from Award Struct

# "Blue First", increases in quality as the expiration date approaches; Quality increases by 2 when there are 10 days or less left, and by 3 where there are 5 days or less left, but quality value drops to 0 after the expiration date.
# "Blue First" awards actually increase in quality the older they get
class BlueFirst < Award
  def update_quality
    decrease_expiry
    increase_quality
    increase_quality if expired?
  end
end

# "Blue Compare", similar to "Blue First", increases in quality as the expiration date approaches; Quality increases by 2 when there are 10 days or less left, and by 3 where there are 5 days or less left, but quality value drops to 0 after the expiration date.
class BlueCompare < Award

  def update_quality
    decrease_expiry
    if expired?
      self.quality = 0
    else
      increase_quality
      if self.quality > 50
        self.quality = 50
      end
    end
  end

  def increase_quality
    self.quality += 1
    if expires_in < 10 && expires_in >= 5
      self.quality += 1
    end
    if expires_in < 5
      self.quality += 2

    end
  end
end

# "Blue Distinction Plus", being a highly sought distinction, never decreases in quality.  "Blue Distinction Plus", being highly sought, its quality is 80 and it never alters.
class BlueDistinctionPlus < Award
  def update_quality
    self.quality = 80
  end

  def decrease_expiry
    self.expires_in -= 1
  end

end

# "Blue Star" awards should lose quality value twice as fast as normal awards.
class BlueStar < Award
  def decrease_quality
    self.quality -= 2 unless self.quality == 0
  end
end

def update_quality(awards)
  awards.each do |award|
    award.update_quality
  end
end
