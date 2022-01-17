class Temperature < ApplicationRecord
  validates :taion, presence: true, numericality: {greater_than_or_equal_to: 30.0, less_than_or_equal_to: 45.0}, format: {with: /\A[0-9][0-9](.[0-9])\z/}
  belongs_to :user
  
  scope :health_filter, -> (filter_params) do
    return if filter_params.blank?
    day_from_is(filter_params[:day_from]).day_to_is(filter_params[:day_to]).health_yes(filter_params[:health]).health_no(filter_params[:health])
  end
  scope :day_from_is, -> (from) { where('? <= date', from) if from.present? }
  scope :day_to_is, -> (to) { where('date <= ?', to) if to.present? }
  scope :health_yes, -> (hlt) { where('health IS NOT NULL OR taion >= 37.5') if hlt == 'yes' }
  scope :health_no, -> (hlt) { where('health IS NULL AND taion < 37.5') if hlt == 'no' }
end