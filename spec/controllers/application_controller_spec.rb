require "spec_helper"

describe ApplicationController do
  controller do
    def index
      current_company
      render nothing: true
    end
  end

  describe "#current_company" do
    before(:each) do
      @company = mock_model(Company)
      @user    = mock_model(User, company: @company)
    end

    context "with logged in user" do
      before(:each) do
        controller.stub!(:current_user).and_return(@user)
      end

      it "finds current user's company" do
        @user.should_receive(:company)
        get :index
      end
    end

    context "without a logged in user" do
      before(:each) do
        controller.stub!(:current_user).and_return(nil)
      end
    end
  end
end
