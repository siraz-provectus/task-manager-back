class Task < ApplicationRecord
	STATUS = %w(new in_process resolved closed reopened)

	belongs_to :reporter, class_name: 'User', foreign_key: 'reporter_id'
	belongs_to :implementer, class_name: 'User', foreign_key: 'assigned_to', optional: true
	belongs_to :employer, class_name: 'User', foreign_key: 'assigned_by', optional: true

	validates :title, :reporter, presence: true
	validates :status, inclusion: {in: STATUS, message: I18n.t(:'messages.invalid_value')}

	scope :status_new, -> { where(status: 'new') }
	scope :in_process, -> { where(status: 'in_process') }
	scope :complete, -> { where(status: ['resolved', 'closed']) }
end
