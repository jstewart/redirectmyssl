require "rails_helper"

RSpec.describe "/redirects", type: :request do
  context "not logged in" do
    describe "GET /index" do
      before { get redirects_url }
      it { should redirect_to(user_session_path) }
    end

    describe "GET /new" do
      before { get new_redirect_url }
      it { should redirect_to(user_session_path) }
    end

    describe "GET /show/:id" do
      before { get redirect_url(create(:redirect)) }
      it { should redirect_to(user_session_path) }
    end

    describe "GET /edit/:id" do
      before { get edit_redirect_url(create(:redirect)) }
      it { should redirect_to(user_session_path) }
    end

    describe "POST /create" do
      before do
        post redirects_url,
             params: { redirect: attributes_for(:redirect) }
      end

      it { should redirect_to(user_session_path) }
    end

    describe "PATCH /update" do
      before do
        patch redirect_url(create(:redirect)),
        params: { redirect: attributes_for(:redirect) }
      end

      it { should redirect_to(user_session_path) }
    end

    describe "DELETE /destroy" do
      before { delete redirect_url(create(:redirect)) }
      it { should redirect_to(user_session_path) }
    end
  end

  context "logged in" do
   login_user
   let(:valid_attributes) { attributes_for(:redirect) }
   let(:invalid_attributes) { attributes_for(:redirect).merge(destination: nil) }

   describe "GET /index" do
     before do
       create(:redirect, user: @current_user)
       get redirects_url
     end

     it { expect(response).to be_successful }
   end

   describe "GET /show" do
     before { get redirect_url(create(:redirect, user: @current_user)) }
     it { expect(response).to be_successful }
   end

   describe "GET /new" do
     before { get new_redirect_url }
     it { expect(response).to be_successful }
   end

   describe "GET /edit" do
     before do
       get edit_redirect_url(create(:redirect,
                                    user: @current_user))
     end

     it { expect(response).to be_successful }
   end

   describe "POST /create" do
     context "with valid parameters" do
       it "creates a new Redirect" do
         expect {
           post redirects_url, params: { redirect: valid_attributes }
         }.to change(Redirect, :count).by(1)
       end

       it "redirects to the created redirect" do
         post redirects_url, params: { redirect: valid_attributes }
         expect(response).to redirect_to(redirect_url(Redirect.last))
       end

       it "assigns the current user as the owner of the redirect" do
         post redirects_url, params: { redirect: valid_attributes }
         expect(Redirect.last.user).to eq(@current_user)
       end
     end

     context "with invalid parameters" do
       it "does not create a new Redirect" do
         expect {
           post redirects_url, params: { redirect: invalid_attributes }
         }.to change(Redirect, :count).by(0)
       end

       it "renders a successful response (i.e. to display the 'new' template)" do
         post redirects_url, params: { redirect: invalid_attributes }
         expect(response).to be_successful
       end
     end
   end

   describe "PATCH /update" do
     context "with valid parameters" do
       let(:new_attributes) {
         attributes_for(:redirect).merge(destination: "http://newplace.example.com")
       }

       it "updates the requested redirect" do
         redirect = @current_user.redirects.create! valid_attributes
         patch redirect_url(redirect), params: { redirect: new_attributes }
         redirect.reload
         expect(redirect.destination).to eq("http://newplace.example.com")
       end

       it "redirects to the redirect" do
         redirect = @current_user.redirects.create! valid_attributes
         patch redirect_url(redirect), params: { redirect: new_attributes }
         redirect.reload
         expect(response).to redirect_to(redirect_url(redirect))
       end
     end

     context "with invalid parameters" do
       it "renders a successful response (i.e. to display the 'edit' template)" do
         redirect = @current_user.redirects.create! valid_attributes
         patch redirect_url(redirect), params: { redirect: invalid_attributes }
         expect(response).to be_successful
       end
     end
   end

   describe "DELETE /destroy" do
     it "destroys the requested redirect" do
       redirect = @current_user.redirects.create! valid_attributes
       expect {
         delete redirect_url(redirect)
       }.to change(Redirect, :count).by(-1)
     end

     it "redirects to the redirects list" do
       redirect = @current_user.redirects.create! valid_attributes
       delete redirect_url(redirect)
       expect(response).to redirect_to(redirects_url)
     end
   end
 end
end
