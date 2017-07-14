require "spec_helper"

describe Moneybird::Resource::Administration do
  let(:client) { faked_client }

  let(:administration) { Moneybird::Resource::Administration.new({id: 123}) }

  before do
    administration.client = client
  end

  it "has a list of sales invoices" do
    client.http.register_request(:GET, '/api/v2/123/sales_invoices', FakeResponse.new(200, json_response(:sales_invoices)))

    sales_invoices = administration.sales_invoices.all
    sales_invoices.length.must_equal 3
  end

  it "has a list of contacts" do
    client.http.register_request(:GET, '/api/v2/123/contacts', FakeResponse.new(200, json_response(:contacts)))

    contacts = administration.contacts.all
    contacts.length.must_equal 3
  end

  it "has a list of estimates" do
    client.http.register_request(:GET, '/api/v2/123/estimates', FakeResponse.new(200, json_response(:estimates)))

    estimates = administration.estimates.all
    estimates.length.must_equal 3
  end

  it "has a list of products" do
    client.http.register_request(:GET, '/api/v2/123/products', FakeResponse.new(200, json_response(:products)))

    products = administration.products.all
    products.length.must_equal 1
  end

  it "has a list of webhooks" do
    client.http.register_request(:GET, '/api/v2/123/webhooks', FakeResponse.new(200, json_response(:webhooks)))

    webhooks = administration.webhooks.all
    webhooks.length.must_equal 1
  end

  it "has a list of workflows" do
    client.http.register_request(:GET, '/api/v2/123/workflows', FakeResponse.new(200, json_response(:workflows)))

    workflows = administration.workflows.all
    workflows.length.must_equal 2
  end

  it "has a list of tax_rates" do
    client.http.register_request(:GET, '/api/v2/123/tax_rates', FakeResponse.new(200, json_response(:tax_rates)))

    tax_rates = administration.tax_rates.all
    tax_rates.length.must_equal 3
  end

  it "has a list of recurring_sales_invoices" do
    client.http.register_request(:GET, '/api/v2/123/recurring_sales_invoices', FakeResponse.new(200, json_response(:recurring_sales_invoices)))

    recurring_sales_invoices = administration.recurring_sales_invoices.all
    recurring_sales_invoices.length.must_equal 3
  end

  it "has a list of identities" do
    client.http.register_request(:GET, '/api/v2/123/identities', FakeResponse.new(200, json_response(:identities)))

    identities = administration.identities.all
    identities.length.must_equal 1
  end

  it "has a list of financial_mutations" do
    client.http.register_request(:GET, '/api/v2/123/financial_mutations', FakeResponse.new(200, json_response(:financial_mutations)))

    financial_mutations = administration.financial_mutations.all
    financial_mutations.length.must_equal 1
  end

  it "has a list of financial_accounts" do
    client.http.register_request(:GET, '/api/v2/123/financial_accounts', FakeResponse.new(200, json_response(:financial_accounts)))

    financial_accounts = administration.financial_accounts.all
    financial_accounts.length.must_equal 1
  end
end
