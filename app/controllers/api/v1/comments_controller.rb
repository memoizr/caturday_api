class CommentsController < ApplicationController
  def create
    render json: {hello: "there"}
  end

  def index
    render json: {hey: "foo"}
  end

  def update
  end
end

