class Event < ApplicationRecord

  validates :title, presence: true, length:{in: 5..140}
  validates :description, presence: true, length: {in: 20..1000}
  validates :start_date, presence: true
  validate :not_future_date
  validates :duration, presence: true , numericality: {greater_than: 0}
  validates :duration, numericality: {only_integer: true }
  validates :price, presence: true , length: {in: 1..1000}
  validates :location, presence: true
  validate :duration_multiple_of_5

  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances
  belongs_to :user, required: true, optional: true


private



  def not_future_date
    if start_date != nil
    if start_date < Time.now

 errors.add(:start_date, "la date doit etre dans le futur")
  end
else
  errors.add(:start_date, "la date doit etre remplie")
  end

end

  def duration_multiple_of_5
    if duration != nil
  		if duration % 5 != 0 && duration > 0
  			errors.add(:duration, "Un multiple de 5 et on balance ton event dans les bacs !")
  		end
    else
      errors.add(:duration, "la duree doit etre remplie!")
    end
    end







end
