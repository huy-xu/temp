require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  let(:valid_attributes) {
    { title: "Test Board", description: "This is a test board.", author: "Author" }
  }

  let(:invalid_attributes) {
    { title: "", description: "", author: "" }
  }

  describe "GET #index" do
    it "returns a success response" do
      board = Board.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      board = Board.create! valid_attributes
      get :show, params: { id: board.to_param }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Board" do
        expect {
          post :create, params: { board: valid_attributes }
        }.to change(Board, :count).by(1)
      end

      it "redirects to the created board" do
        post :create, params: { board: valid_attributes }
        expect(response).to redirect_to(Board.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e., to display the 'new' template)" do
        post :create, params: { board: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      board = Board.create! valid_attributes
      get :edit, params: { id: board.to_param }
      expect(response).to be_successful
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { title: "Updated Board", description: "This is an updated board.", author: "Updated Author" }
      }

      it "updates the requested board" do
        board = Board.create! valid_attributes
        put :update, params: { id: board.to_param, board: new_attributes }
        board.reload
        expect(board.title).to eq("Updated Board")
        expect(board.description).to eq("This is an updated board.")
        expect(board.author).to eq("Updated Author")
      end

      it "redirects to the board" do
        board = Board.create! valid_attributes
        put :update, params: { id: board.to_param, board: valid_attributes }
        expect(response).to redirect_to(board)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e., to display the 'edit' template)" do
        board = Board.create! valid_attributes
        put :update, params: { id: board.to_param, board: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested board" do
      board = Board.create! valid_attributes
      expect {
        delete :destroy, params: { id: board.to_param }
      }.to change(Board, :count).by(-1)
    end

    it "redirects to the boards list" do
      board = Board.create! valid_attributes
      delete :destroy, params: { id: board.to_param }
      expect(response).to redirect_to(boards_url)
    end
  end
end
