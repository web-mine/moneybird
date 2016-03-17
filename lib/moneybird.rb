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
require "moneybird/service/document_style"
require "moneybird/service/estimate"
require "moneybird/service/financial_account"
require "moneybird/service/financial_mutation"
require "moneybird/service/identity"
require "moneybird/service/product"
require "moneybird/service/recurring_sales_invoice"
require "moneybird/service/sales_invoice"
require "moneybird/service/tax_rate"
require "moneybird/service/webhook"
require "moneybird/service/workflow"

require "moneybird/client"

require "moneybird/resource"
require "moneybird/resource/administration"
require "moneybird/resource/contact"
require "moneybird/resource/document_style"
require "moneybird/resource/estimate"
require "moneybird/resource/financial_account"
require "moneybird/resource/financial_mutation"
require "moneybird/resource/identity"
require "moneybird/resource/product"
require "moneybird/resource/recurring_sales_invoice"
require "moneybird/resource/sales_invoice"
require "moneybird/resource/tax_rate"
require "moneybird/resource/webhook"
require "moneybird/resource/workflow"

require "moneybird/version"
