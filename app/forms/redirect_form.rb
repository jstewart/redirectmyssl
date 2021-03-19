class RedirectForm
  include ActiveModel::Model

  attr_accessor :destination, :hosts, :hostnames, :user

  validates :destination, presence: true, url: true
  validates :hosts, presence: true
  validate :valid_host_lines?

  def initialize(params = {})
    super(params)

    @redirect = Redirect.new(destination: destination, user: user)
    @hosts ||= ""
    @hostnames = generate_hostnames
  end

  def model_name
    ActiveModel::Name.new(self, nil, "Redirect")
  end

  def submit
    return false if invalid?

    ActiveRecord::Base.transaction do
      @redirect.save!
      @redirect.hosts = @hostnames.map { |h| Host.new(hostname: h) }
    end

    true
  rescue ActiveRecord::RecordInvalid
    errors.add(:base, "transaction rolled back")

    false
  end

  private

  def generate_hostnames
    @hosts.split(/\n/).map(&:strip).map.uniq
  end

  def valid_host_lines?
    unless hostnames.all? do |h|
             h =~
               /(?=^.{4,253}$)(^((?!-)[a-zA-Z0-9-]{1,63}(?<!-)\.)+[a-zA-Z]{2,63}$)/
           end
      errors.add(:hosts, "is not a valid hosts list")
    end
  end
end
