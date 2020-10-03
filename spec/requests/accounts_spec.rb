 require "rails_helper"

 RSpec.describe "/accounts", type: :request do
   let(:valid_attributes) {
     attributes_for(:account)
   }

   let(:invalid_attributes) {
     attributes_for(:account, :missing_email)
   }

   describe "GET /index" do
     it "renders a successful response" do
       Account.create! valid_attributes
       get accounts_url
       expect(response).to be_successful
     end
   end

   describe "GET /show" do
     it "renders a successful response" do
       account = Account.create! valid_attributes
       get account_url(account)
       expect(response).to be_successful
     end
   end

   describe "GET /new" do
     it "renders a successful response" do
       get new_account_url
       expect(response).to be_successful
     end
   end

   describe "GET /edit" do
     it "render a successful response" do
       account = Account.create! valid_attributes
       get edit_account_url(account)
       expect(response).to be_successful
     end
   end

   describe "POST /create" do
     context "with valid parameters" do
       it "creates a new Account" do
         expect {
           post accounts_url, params: { account: valid_attributes }
         }.to change(Account, :count).by(1)
       end

       it "redirects to the created account" do
         post accounts_url, params: { account: valid_attributes }
         expect(response).to redirect_to(account_url(Account.last))
       end
     end

     context "with invalid parameters" do
       it "does not create a new Account" do
         expect {
           post accounts_url, params: { account: invalid_attributes }
         }.to change(Account, :count).by(0)
       end

       it "renders a successful response (i.e. to display the 'new' template)" do
         post accounts_url, params: { account: invalid_attributes }
         expect(response).to be_successful
       end
     end
   end

   describe "PATCH /update" do
     context "with valid parameters" do
       let(:new_attributes) {
         attributes_for(:account, email: "foo@example.com")
       }

       it "updates the requested account" do
         account = Account.create! valid_attributes
         patch account_url(account), params: { account: new_attributes }
         account.reload
         expect(account.email).to eq("foo@example.com")
       end

       it "redirects to the account" do
         account = Account.create! valid_attributes
         patch account_url(account), params: { account: new_attributes }
         account.reload
         expect(response).to redirect_to(account_url(account))
       end
     end

     context "with invalid parameters" do
       it "renders a successful response (i.e. to display the 'edit' template)" do
         account = Account.create! valid_attributes
         patch account_url(account), params: { account: invalid_attributes }
         expect(response).to be_successful
       end
     end
   end

   describe "DELETE /destroy" do
     it "destroys the requested account" do
       account = Account.create! valid_attributes
       expect {
         delete account_url(account)
       }.to change(Account, :count).by(-1)
     end

     it "redirects to the accounts list" do
       account = Account.create! valid_attributes
       delete account_url(account)
       expect(response).to redirect_to(accounts_url)
     end
   end
 end
