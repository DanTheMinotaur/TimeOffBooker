require 'singleton'

class Company
  ##
  # Singleton Class for defining Company data
  include Singleton
  attr_accessor :country, :news_term, :company_name

  def initialize(company_name=nil, news_term=nil, country=nil)
    @company_name = company_name
    @news_term = news_term
    @country = country
  end

  def set_company_name(company_name)
    @company_name = company_name
  end

  def set_news_term(news_term)
    @news_term = news_term
  end

  def set_country(country)
    @country = country
  end

end
