class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    URI.parse(value)
  rescue URI::Error
    record.errors[attribute] << (options[:message] || "is not a valid #{attribute}")
  end
end
