class AccountsController < ApplicationController
  def show
    @account = Account.find(params[:id])
    @private = @account.private_stories
    @public = @account.public_stories
    @invalid = @account.invalid_stories
  end
end
