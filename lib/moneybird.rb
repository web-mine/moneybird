require 'uri'
require 'json'
require 'net/http'

module Moneybird
  module Service; end;
  module Traits; end;
end

require "moneybird/traits/administration_service"
require "moneybird/traits/find_all"

require "moneybird/service/administration"
require "moneybird/service/contact"
require "moneybird/service/estimate"
require "moneybird/service/sales_invoice"
require "moneybird/service/product"

require "moneybird/client"

require "moneybird/resource"
require "moneybird/resource/contact"
require "moneybird/resource/administration"
require "moneybird/resource/product"
require "moneybird/resource/estimate"
require "moneybird/resource/workflow"
require "moneybird/resource/tax_rate"
require "moneybird/resource/webhook"
require "moneybird/resource/sales_invoice"
require "moneybird/resource/recurring_sales_invoice"

require "moneybird/version"
